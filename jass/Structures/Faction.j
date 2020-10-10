library Faction initializer OnInit requires Persons, Event, Set, QuestData

  globals
    Event OnFactionCreate = 0
    Event OnFactionTeamLeave
    Event OnFactionTeamJoin
    Event OnFactionGameLeave

    constant integer UNLIMITED = 200    //This is used in Persons and Faction for effectively unlimited unit production
    constant integer HERO_COST = 100    //For refunding
    private constant real REFUND_PERCENT = 1.00          //How much gold and lumber is refunded from units that get refunded on leave
    private constant real XP_TRANSFER_PERCENT = 1.00     //How much experience is transferred from heroes that leave the game
  endglobals

  struct Faction
    readonly static StringTable factionsByName
    readonly static thistype triggerFaction = 0
    readonly static thistype triggerFactionPrevTeam = 0
    
    readonly string name = null
    readonly playercolor playCol = null
    readonly string prefixCol = null
    readonly string icon = null
    private integer weight //An estimation of this Faction's tech-tree strength. Used to calculate how many Factions can fit in a team before they incur penalties

    private Person person = 0 //One-to-one relationship
    private Team team = 0 //The team this Faction is in
    readonly integer xp = 0 //Stored by DistributeUnits and given out again by DistributeResources
    
    readonly integer absenceResearch = 0  //This upgrade is researched for all players only if this Faction slot is unoccupied
    readonly integer presenceResearch = 0 //This upgrade is researched for all players only if this Faction slot is occupied
    private string victoryMusic
    
    readonly Table objectLimits //This is how many units, researches or structures of a given type this faction can build
    readonly integer array objectList[100] //An index for objectLimits
    readonly integer objectCount = 0

    private Table objectLevels
    private integer array objectLevelList[100]
    private integer objectLevelCount = 0

    private QuestData startingQuest
    private integer questCount = 0
    private QuestData array quests[100]

    method operator ObjectLimitCount takes nothing returns integer
      return this.objectCount
    endmethod

    method operator Weight takes nothing returns integer
      return this.weight
    endmethod

    method operator Gold takes nothing returns real
      return I2R(GetPlayerState(this.Player, PLAYER_STATE_RESOURCE_GOLD))
    endmethod

    method operator Gold= takes real value returns nothing
      call SetPlayerState(this.Player, PLAYER_STATE_RESOURCE_GOLD, R2I(value))
    endmethod

    method operator Lumber takes nothing returns real
      return I2R(GetPlayerState(this.Player, PLAYER_STATE_RESOURCE_LUMBER))
    endmethod

    method operator Lumber= takes real value returns nothing
      call SetPlayerState(this.Player, PLAYER_STATE_RESOURCE_LUMBER, R2I(value))
    endmethod

    method operator Team takes nothing returns Team
      return this.team
    endmethod

    private stub method OnTeamChange takes nothing returns nothing

    endmethod

    method operator Team= takes Team team returns nothing
      if this.team != 0 then
        set thistype.triggerFaction = this
        call this.team.RemoveFaction(this)
        set this.triggerFactionPrevTeam = this.team
        set this.team = 0
        call OnFactionTeamLeave.fire()
      endif  

      if team != 0 then
        call team.AddFaction(this)
        set this.team = team
        set thistype.triggerFaction = this
        call OnFactionTeamJoin.fire()
      endif
      call OnTeamChange()
    endmethod

    stub method operator ControlPointCountAsString takes nothing returns string
      return I2S(this.Person.ControlPointCount)
    endmethod

    stub method operator Income takes nothing returns real
      return this.Person.ControlPointValue
    endmethod

    method operator ColoredName takes nothing returns string
      return this.prefixCol + this.name + "|r"
    endmethod

    method operator Name takes nothing returns string
      return this.name
    endmethod

    method operator Player takes nothing returns player
      return this.Person.Player
    endmethod

    method operator Person takes nothing returns Person
      return this.person
    endmethod

    stub method OnPersonChange takes nothing returns nothing
    
    endmethod

    method operator Person= takes Person value returns nothing
      if this.Player != null then
        call this.Team.UnallyPlayer(this.Player)
        call HideAllQuests()
        call this.UnapplyObjects()
      endif
      set this.person = value
      //Maintan referential integrity
      if value == 0 then
        return
      endif
      if value.Faction != this then
        set value.Faction = this
      endif
      call this.Team.AllyPlayer(value.Player)
      call ApplyObjects()
      call ShowAllQuests()
    endmethod

    method operator StartingQuest takes nothing returns QuestData
      return startingQuest
    endmethod

    method operator StartingQuest= takes QuestData questData returns nothing
      set startingQuest = questData
    endmethod

    method operator VictoryMusic= takes string whichMusic returns nothing
      set this.victoryMusic= whichMusic
    endmethod

    method operator VictoryMusic takes nothing returns string
      return this.victoryMusic
    endmethod

    stub method operator CanBeInvited takes nothing returns boolean
      return true
    endmethod

    //Adds this Faction's object limits and levels to its active Person
    private method ApplyObjects takes nothing returns nothing
      local Person person = this.Person
      local integer i = 0
      //Limits
      loop
        exitwhen i == this.objectCount
        call this.Person.ModObjectLimit(this.objectList[i], this.objectLimits[this.objectList[i]])
        set i = i + 1
      endloop             
      //Levels
      set i = 0
      loop
      exitwhen i == this.objectLevelCount
        call this.Person.SetObjectLevel(this.objectLevelList[i], this.objectLevels[this.objectLevelList[i]])
        set i = i + 1
      endloop
    endmethod

    //Removes this Faction's object limits and levels from its active Person
    private method UnapplyObjects takes nothing returns nothing
      local Person person = this.person
      local integer i = 0
      //Limits
      loop 
      exitwhen i == this.objectCount
        call this.Person.ModObjectLimit(this.objectList[i], -this.objectLimits[this.objectList[i]])
        set i = i + 1
      endloop    
      //Levels
      set i = 0
      loop
      exitwhen i == this.objectLevelCount
        call this.Person.SetObjectLevel(this.objectLevelList[i], 0)
        set i = i + 1
      endloop
      set i = 0
    endmethod

    stub method Unally takes nothing returns nothing
      local string newTeamName = this.Name + " Pact"
      local Team newTeam = 0

      if this.Team.PlayerCount > 1 then
        set newTeam = Team.teamsByName[newTeamName]
        if newTeam == 0 then
          set newTeam = Team.create(newTeamName)
        endif
        set this.Team = newTeam
      endif
    endmethod

    method ShowAllQuests takes nothing returns nothing
      local integer i = 0
      if GetLocalPlayer() == this.Player then
        loop
          exitwhen i == this.questCount
          call this.quests[i].Show()
          set i = i + 1
        endloop
      endif
    endmethod

    method HideAllQuests takes nothing returns nothing
      local integer i = 0
      if GetLocalPlayer() == this.Player then
        loop
          exitwhen i == this.questCount
          call quests[i].Hide()
          set i = i + 1
        endloop
      endif
    endmethod

    method AddQuest takes QuestData questData returns QuestData
      set questData.Holder = this
      set this.quests[this.questCount] = questData
      set this.questCount = this.questCount + 1
      if GetLocalPlayer() == this.Player then
        call questData.Show()
      endif
      return questData
    endmethod

    method modWeight takes integer value returns nothing
      if value < 0 then
        call BJDebugMsg("ERROR: Attempted to reduce weight of Faction " + this.name + " to " + I2S(value)) 
        return
      endif
      set this.weight = value
    endmethod

    method GetObjectLevel takes integer object returns integer
      return this.objectLevels[object]
    endmethod

    private stub method OnSetObjectLevel takes integer object, integer level returns nothing

    endmethod

    method SetObjectLevel takes integer object, integer level returns nothing
      if not this.objectLevels.exists(object) then
        set this.objectLevelList[this.objectLevelCount] = object
        set this.objectLevelCount = this.objectLevelCount + 1
      endif
      set this.objectLevels[object] = level
      if this.Person != 0 then
        call this.Person.SetObjectLevel(object, level)
      endif
      call this.OnSetObjectLevel(object, level)
    endmethod

    method modObjectLimit takes integer id, integer limit returns nothing
      local Person affectedPerson = 0

      if this.objectLimits.exists(id) then
        set this.objectLimits[id] = this.objectLimits[id] + limit
      else
        set this.objectLimits[id] = limit         
        set this.objectList[this.objectCount] = id
        set this.objectCount = this.objectCount + 1       
      endif

      //If a Person has this Faction, adjust their techtree as well
      if this.Person != 0 then
        call this.Person.ModObjectLimit(id, limit)
      endif

      if this.objectLimits[id] == 0 then
        call this.objectLimits.flush(id)
      endif        
    endmethod

    method operator PresenceResearch= takes integer research returns nothing
      local integer i = 0
      if this.presenceResearch == 0 then
        set this.presenceResearch = research
        loop
        exitwhen i > MAX_PLAYERS
          call SetPlayerTechResearched(Player(i), this.presenceResearch, 0)
          set i = i + 1
        endloop                
      else
        call BJDebugMsg("ERROR: attempted to set presence research for faction " + this.name + " but one is already set")
      endif
    endmethod

    method operator AbsenceResearch= takes integer research returns nothing
      local integer i = 0
      if this.absenceResearch == 0 then
        set this.absenceResearch = research
        loop
        exitwhen i > MAX_PLAYERS
          call SetPlayerTechResearched(Player(i), this.absenceResearch, 1)
          set i = i + 1
        endloop
      else
        call BJDebugMsg("ERROR: attempted to set absence research for faction " + this.name + " but one is already set")
      endif
    endmethod                   

    method registerObjectLimit takes integer id, integer limit returns nothing
      if not this.objectLimits.exists(id) then
        set this.objectLimits[id] = limit
        set objectList[objectCount] = id
        set this.objectCount = this.objectCount + 1
      else
        call BJDebugMsg("ERROR: attempted to register already registered id " + I2S(id) + " to faction " + this.name)
      endif       
    endmethod

    //Any time the player loses the game. E.g. Frozen Throne loss, Kil'jaeden loss
    method obliterate takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local unit u = null
      local UnitType tempUnitType = 0

      //Take away resources
      call SetPlayerState(this.Player, PLAYER_STATE_RESOURCE_GOLD, 0)
      call SetPlayerState(this.Player, PLAYER_STATE_RESOURCE_LUMBER, 0)

      //Give all units to Neutral Victim
      call GroupEnumUnitsOfPlayer(tempGroup, this.Player, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null 
        set tempUnitType = UnitType.ByHandle(u)           
        if not tempUnitType.Meta then
          call SetUnitOwner(u, Player(bj_PLAYER_NEUTRAL_VICTIM), false)
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop

      //Cleanup
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    private method distributeExperience takes nothing returns nothing
      local integer i = 0
      local group tempGroup = CreateGroup()
      local unit u = null
      local integer heroCount = 0

      loop
        exitwhen i == this.team.FactionCount
        if this.team.GetFactionByIndex(i).Person != 0 then
          call GroupEnumUnitsOfPlayer(tempGroup, this.team.GetFactionByIndex(i).Player, function IsUnitHeroEnum)
          set heroCount = BlzGroupGetSize(tempGroup)
          loop
            set u = FirstOfGroup(tempGroup)
            exitwhen u == null
            call AddHeroXP(u, R2I((this.xp / (this.team.PlayerCount-1) / heroCount) * XP_TRANSFER_PERCENT), true)
            call GroupRemoveUnit(tempGroup, u)
          endloop
        endif
        set i = i + 1
      endloop
      set this.xp = 0

      //Cleanup
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    private method distributeResources takes nothing returns nothing
      local integer i = 0
      local Faction loopFaction
      loop
        exitwhen i == this.team.FactionCount
        set loopFaction = this.team.GetFactionByIndex(i)
        if loopFaction.Person != 0 then
          set loopFaction.Gold = loopFaction.Gold + this.Gold / this.team.PlayerCount-1
          set loopFaction.Lumber = loopFaction.Lumber + this.Lumber / this.team.PlayerCount-1
        endif
        set i = i + 1
      endloop
      set this.Gold = 0
      set this.Lumber = 0
    endmethod

    private method distributeUnits takes nothing returns nothing
      local group g = CreateGroup()
      local unit u = null
      local UnitType loopUnitType = 0
      local force eligiblePlayers = this.Team.CreateForceFromPlayers()

      call ForceRemovePlayer(eligiblePlayers, this.Player)
      call GroupEnumUnitsOfPlayer(g, this.Player, null)

      loop
        set u = FirstOfGroup(g)
        set loopUnitType = UnitType.ByHandle(u)
        exitwhen u == null
        //Refund gold and experience of heroes
        if IsUnitType(u, UNIT_TYPE_HERO) == true then
          call this.Person.addGold(HERO_COST)
          set this.xp = this.xp + GetHeroXP(u)
          //Subtract hero's starting XP from refunded XP
          if Legend.ByHandle(u) != 0 then
            set this.xp = this.xp - Legend.ByHandle(u).StartingXP
          endif
          call UnitDropAllItems(u)
          call RemoveUnit(u)
        //Refund gold and lumber of refundable units
        elseif UnitType.ByHandle(u).Refund == true then
          set this.Gold = this.Gold + loopUnitType.GoldCost * REFUND_PERCENT
          set this.Lumber = this.Lumber + loopUnitType.LumberCost * REFUND_PERCENT
          call UnitDropAllItems(u)
          call RemoveUnit(u)
        //Transfer the ownership of everything else
        elseif UnitType.ByHandle(u).Meta == false then
          if this.Team.PlayerCount > 1 then
            call SetUnitOwner(u, ForcePickRandomPlayer(eligiblePlayers), false)
          else
            call SetUnitOwner(u, Player(bj_PLAYER_NEUTRAL_VICTIM), false)
          endif
        endif
        call GroupRemoveUnit(g, u)
      endloop

      //Cleanup
      call DestroyForce(eligiblePlayers)
      call DestroyGroup(g)
      set eligiblePlayers = null
      set g = null
    endmethod

    stub method OnPreLeave takes nothing returns nothing

    endmethod

    stub method OnLeave takes nothing returns nothing

    endmethod

    //This should get used any time a player exits the game without being defeated; IE they left, went afk, became an observer, or triggered an event that causes this
    method Leave takes nothing returns nothing
      call OnPreLeave()
      if team.PlayerCount > 1 then
        call distributeUnits()
        call distributeResources()
        call distributeExperience()
      else
        call obliterate()
      endif
      set thistype.triggerFaction = this
      call OnFactionGameLeave.fire()
      call OnLeave()
    endmethod 

    static method ByHandle takes player whichPlayer returns thistype
      return Person.ByHandle(whichPlayer).Faction
    endmethod

    static method ByName takes string s returns thistype
      return thistype.factionsByName[s]
    endmethod

    static method create takes string name, playercolor playCol, string prefixCol, string icon, integer weight returns Faction
      local Faction this = Faction.allocate()
    
      set this.name = name
      set this.playCol = playCol
      set this.prefixCol = prefixCol
      set this.icon = icon
      set this.weight = weight
      set this.objectLimits = Table.create()
      set this.objectLevels = Table.create()
      
      if not factionsByName.exists(StringCase(name,false)) then
        set factionsByName[StringCase(name,false)] = this
      else
        call BJDebugMsg("Error: created faction that already exists with name " + name)
      endif 

      set thistype.triggerFaction = this
      call OnFactionCreate.fire()   
      
      return this                
    endmethod       

    private static method OnAnyResearch takes nothing returns nothing
      local Faction faction = Faction.ByHandle(GetTriggerPlayer())
      if faction != 0 then
        call faction.SetObjectLevel(GetResearched(), GetPlayerTechCount(GetTriggerPlayer(), GetResearched(), false))
      endif
    endmethod

    private static method onInit takes nothing returns nothing
      local trigger trig = CreateTrigger()

      set Faction.factionsByName = StringTable.create()
      set OnFactionTeamLeave = Event.create()
      set OnFactionTeamJoin = Event.create()
      set OnFactionGameLeave = Event.create()
      
      call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
      call TriggerAddAction(trig, function thistype.OnAnyResearch)
    endmethod 
  endstruct

  function GetTriggerFaction takes nothing returns Faction
    return Faction.triggerFaction
  endfunction

  function GetTriggerFactionPrevTeam takes nothing returns Team
    return Faction.triggerFactionPrevTeam
  endfunction

  private function OnInit takes nothing returns nothing
    set OnFactionCreate = Event.create()
  endfunction

endlibrary