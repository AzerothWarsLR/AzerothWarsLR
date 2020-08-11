//A "duel" consists of two sides of factions that each control a number of capitals.
//Once one side loses all of their capitals, or a member of one faction allies a member of the other faction, their duel ends.
//Ending a duel updates a global research and a quest.

library Duel initializer OnInit requires Environment

  globals
    constant integer DUEL_STATUS_UNFINISHED = 0
    constant integer DUEL_STATUS_FINISHED = 1

    Event OnDuelEnd
  endglobals

  function FactionDuelStatus takes Faction whichFaction returns integer
    local Duel nextDuel
    local integer i = 0
    local integer j = 0
    set nextDuel = Duel.first
    loop
      exitwhen nextDuel == 0
      if nextDuel.Ongoing then
        set j = 0
        loop
          exitwhen j == nextDuel.belligerentCount
          if nextDuel.belligerents[j].ContainsFaction(whichFaction) then
            return DUEL_STATUS_UNFINISHED
          endif
          set j = j + 1
        endloop
      endif
      set nextDuel = nextDuel.next
    endloop
    return DUEL_STATUS_FINISHED
  endfunction

  function GetTriggerDuel takes nothing returns Duel
    return Duel.triggerDuel
  endfunction

  struct Belligerent
    readonly Faction array factions[5]
    readonly group capitals
    readonly integer factionCount
    readonly boolean alive = true
    public questitem questitem

    method updateDesc takes nothing returns nothing
      local integer i = 0
      local integer j = 0
      local string desc = ""
      loop
        exitwhen i == factionCount
        set desc = desc + factions[i].prefixCol + factions[i].name + "|r"
        if factions[i + 1] != 0 then
          if factions[i + 2] == 0 then
            set desc = desc + " and "
          else
            set desc = desc + ", "  
          endif
        else
          set desc = desc + " lost "
        endif
        set i = i + 1
      endloop
      set i = 0
      loop 
        exitwhen i == BlzGroupGetSize(capitals)
        set desc = desc + GetUnitName(BlzGroupUnitAt(capitals, i))

        if BlzGroupUnitAt(capitals, i + 1) != null then
          if BlzGroupUnitAt(capitals, i + 2) == null then
            set desc = desc + " and "
          else
            set desc = desc + ", "
          endif
        endif

        set i = i + 1
      endloop
      call QuestItemSetDescription(this.questitem, desc)
    endmethod

    method operator Alive takes nothing returns boolean
      return alive
    endmethod

    method UpdateAlive takes nothing returns boolean
      //Any of this belligerent's factions control any of that belligerent's capitals
      local integer i = 0
      local integer j = 0
      set this.alive = false
      loop
        exitwhen i == factionCount
        set j = 0
        loop
          exitwhen j == BlzGroupGetSize(capitals)
          if BlzGroupUnitAt(capitals, j) != null and UnitAlive(BlzGroupUnitAt(capitals, j)) == true and GetOwningPlayer(BlzGroupUnitAt(capitals, j)) == factions[i].Person.p then
            set this.alive = true
            return alive
          endif
          set j = j + 1
        endloop
        set i = i + 1
      endloop
      call QuestItemSetCompleted(this.questitem, not this.alive)
      return this.alive
    endmethod

    method ContainsPlayer takes player whichPlayer returns boolean
      return ContainsFaction(Persons[GetPlayerId(whichPlayer)].Faction)
    endmethod

    method ContainsFaction takes Faction whichFaction returns boolean
      local integer i = 0
      loop
        exitwhen i == factionCount
        if factions[i] == whichFaction then
          return true
        endif
        set i = i + 1
      endloop
      return false
    endmethod

    method addFaction takes Faction whichFaction returns nothing
      set factions[factionCount] = whichFaction
      set factionCount = factionCount + 1
    endmethod

    method addCapital takes unit u returns nothing
      call GroupAddUnit(capitals, u)
    endmethod

    static method create takes nothing returns thistype
      local thistype this = thistype.allocate()
      set this.capitals = CreateGroup()
      return this
    endmethod
  endstruct

  struct Duel
    readonly static group allCapitals
    readonly static trigger trigUnitChangeOwner
    readonly static thistype first = 0
    readonly static thistype last = 0
    readonly static thistype triggerDuel

    readonly string title
    readonly Belligerent array belligerents[5]
    private Belligerent winners = 0
    readonly integer belligerentCount = 0
    readonly integer research
    readonly integer status
    readonly quest quest
    readonly thistype next
    private boolean ongoing = true

    method GetBelligerent takes integer i returns Belligerent
      return belligerents[i]
    endmethod

    method operator Winners takes nothing returns Belligerent
      return this.winners
    endmethod

    method operator Research= takes integer newResearch returns nothing
      if this.research == 0 then
        set this.research = newResearch
      else
        call BJDebugMsg("ERROR: Attempted to set research of duel " + this.title + " more than once")
      endif
    endmethod

    method ContainsPlayer takes player whichPlayer returns boolean
      local integer i = 0
      loop
        exitwhen i == belligerentCount
        if belligerents[i].ContainsPlayer(whichPlayer) then
          return true
        endif
        set i = i + 1
      endloop
      return false
    endmethod

    private method updateDesc takes nothing returns nothing
      local integer i = 0
      loop
        exitwhen i == belligerentCount
        call belligerents[i].updateDesc()
        set i = i + 1
      endloop
    endmethod

    private method operator Status= takes integer whichStatus returns nothing
      local integer i = 0
      if this.status == whichStatus then
        return
      endif
      if this.status != DUEL_STATUS_UNFINISHED then
        call BJDebugMsg("ERROR: Attempted to change status of already finished duel " + this.title)
        return
      endif
      set this.status = whichStatus
      if this.status == DUEL_STATUS_FINISHED then
        call QuestSetCompleted(this.quest, true)
        loop
          exitwhen i == MAX_PLAYERS
          call SetPlayerTechMaxAllowed(Player(i), this.research, 1)
          call SetPlayerTechResearched(Player(i), this.research, 1)
          set i = i + 1
        endloop
      endif
    endmethod

    method UpdateOngoing takes nothing returns boolean
      local integer aliveCount = 0
      local integer i = 0
      local Belligerent lastAlive = 0
      loop
        exitwhen i == belligerentCount
        if belligerents[i].UpdateAlive() then
          set lastAlive = belligerents[i]
          set aliveCount = aliveCount + 1
        endif
        set i = i + 1
      endloop
      if aliveCount < 2 then
        set this.ongoing = false
        set this.winners = lastAlive
      endif
      return this.ongoing
    endmethod

    method operator Ongoing takes nothing returns boolean
      return ongoing
    endmethod
      
    private static method unitLost takes nothing returns nothing
      local thistype nextDuel
      if IsUnitInGroup(GetTriggerUnit(), thistype.allCapitals) then
        set nextDuel = thistype.first
        loop
          exitwhen nextDuel == 0
          if nextDuel.Ongoing == true then
            if nextDuel.UpdateOngoing() == false then
              set nextDuel.Status = DUEL_STATUS_FINISHED
              set triggerDuel = nextDuel
              call OnDuelEnd.fire()
            endif
          endif
          set nextDuel = nextDuel.next
        endloop
      endif
    endmethod

    method addBelligerent takes Belligerent whichBelligerent returns nothing
      set belligerents[belligerentCount] = whichBelligerent
      set belligerentCount = belligerentCount + 1
      set whichBelligerent.questitem = QuestCreateItem(this.quest)
      call BlzGroupAddGroupFast(whichBelligerent.capitals, thistype.allCapitals)
      call updateDesc()
    endmethod

    static method create takes string title, string desc, string icon returns thistype
      local thistype this = thistype.allocate()
      set this.ongoing = true
      set this.title = title
      set this.quest = CreateQuest()
      call QuestSetTitle(this.quest, title)
      call QuestSetIconPath(this.quest, icon)
      call QuestSetRequired(this.quest, true)
      call QuestSetEnabled(this.quest, true)
      call QuestSetDescription(this.quest, desc)
      set this.status = DUEL_STATUS_UNFINISHED
      if thistype.first == 0 then
        set thistype.first = this
      endif
      if thistype.last != 0 then
        set thistype.last.next = this
      endif
      set thistype.last = this
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      set thistype.allCapitals = CreateGroup()
      set trigUnitChangeOwner = CreateTrigger()
      call TriggerRegisterAnyUnitEventBJ(trigUnitChangeOwner, EVENT_PLAYER_UNIT_CHANGE_OWNER)
      call TriggerRegisterAnyUnitEventBJ(trigUnitChangeOwner, EVENT_PLAYER_UNIT_DEATH)
      call TriggerAddAction(trigUnitChangeOwner, function thistype.unitLost)
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    set OnDuelEnd = Event.create()
  endfunction

endlibrary