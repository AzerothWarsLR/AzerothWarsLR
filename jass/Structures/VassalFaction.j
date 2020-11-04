library VassalFaction requires Faction

  globals
    private constant real VASSAL_INCOME_PER_MINUTE = 60
    private constant real VASSAL_STARTING_GOLD = 150
    private constant integer VASSAL_STARTING_LUMBER = 150
  endglobals

  function GetTeamVassalCount takes Team whichTeam returns integer
    local integer i = 0
    local integer count = 0
    loop
      exitwhen i == whichTeam.FactionCount
      if whichTeam.GetFactionByIndex(i).Person != 0 and whichTeam.GetFactionByIndex(i).getType() == VassalFaction.typeid then
        set count = count + 1
      endif
      set i = i + 1
    endloop
    return count
  endfunction

  //The number of vassals on the team with the most vassals
  function GetVassalMaximum takes nothing returns integer
    local integer maximum = 0
    local integer i = 0
    local Team loopTeam
    local Faction loopFaction
    local integer teamActiveVassalCount
    loop
      exitwhen i == Team.Count
      set teamActiveVassalCount = GetTeamVassalCount(Team.ByIndex(i))
      if teamActiveVassalCount > maximum then
        set maximum = teamActiveVassalCount
      endif
      set i = i + 1
    endloop
    return maximum
  endfunction

  //The number of vassals on the team with the fewest vassals
  function GetVassalMinimum takes nothing returns integer
    local integer minimum = MAX_PLAYERS
    local integer i = 0
    local Team loopTeam
    local Faction loopFaction
    local integer teamActiveVassalCount
    loop
      exitwhen i == Team.Count
      set teamActiveVassalCount = GetTeamVassalCount(Team.ByIndex(i))
      if teamActiveVassalCount < minimum then
        set minimum = teamActiveVassalCount
      endif
      set i = i + 1
    endloop
    return minimum
  endfunction

  struct VassalFaction extends Faction
    private static thistype array byIndex
    private static integer count = 0
    private Faction liege
    private integer research
    private Legend legend
    private integer workerItemType = 0 
    private integer teleportItemType = 0

    method operator WorkerItemType= takes integer itemType returns nothing
      set this.workerItemType = itemType
    endmethod

    method operator TeleportItemType= takes integer itemType returns nothing
      set this.teleportItemType = itemType
    endmethod

    method operator ControlPointCountAsString takes nothing returns string
      return " "
    endmethod

    method operator Income takes nothing returns real
      return VASSAL_INCOME_PER_MINUTE
    endmethod

    method operator Liege takes nothing returns LiegeFaction
      return liege
    endmethod

    method operator Weight takes nothing returns integer
      return 0
    endmethod

    method operator CanBeInvited takes nothing returns boolean
      return false
    endmethod

    method operator Liege= takes LiegeFaction liege returns nothing
      set this.liege = liege
      call liege.AddVassal(this)
    endmethod

    private method Unally takes nothing returns nothing

    endmethod

    private method OnTeamChange takes nothing returns nothing
      if this.Team != liege.Team then
        call BJDebugMsg("ERROR: Vassal faction " + this.name + " is on team " + this.Team.Name + " and should be on liege " + liege.Name + "'s Team " + liege.Team.Name)
      endif
    endmethod

    static method create takes string name, playercolor playCol, string prefixCol, string icon, Faction liege, Legend legend returns thistype
      local thistype this = thistype.allocate(name, playCol, prefixCol, icon, 0)
      set this.Liege = liege
      set this.Team = this.Liege.Team
      set this.legend = legend
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1
      return this
    endmethod

    private method operator SelectionMessage takes nothing returns string
      return this.prefixCol + this.name + "|r now serves " + Liege.prefixCol + liege.Name + "|r."
    endmethod

    private method DisplaySelection takes nothing returns nothing
      call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "\n|cffffcc00VASSAL SELECTED|r\n" + this.SelectionMessage)
    endmethod

    private method SelectForPerson takes Person whichPerson returns nothing
      local ControlPoint highestValueCP
      local integer vassalMaximum = 0
      if whichPerson.Faction == this.Liege then
        call DisplayTextToPlayer(whichPerson.Player, 0, 0, "You can't become your own vassal.")
        return
      endif
      if whichPerson.Faction!= 0 and whichPerson.Faction.getType() == VassalFaction.typeid then
        call DisplayTextToPlayer(whichPerson.Player, 0, 0, "You are already a vassal.")
        return
      endif
      if this.Liege.IsPlayerBannedFromBecomingVassal(whichPerson.Player) then
        call DisplayTextToPlayer(whichPerson.Player, 0, 0, "You're permanently banned from becoming a vassal of " + this.prefixCol + this.name + "|r.")
        return
      endif
      set vassalMaximum = GetVassalMaximum()
      if GetTeamVassalCount(this.Liege.Team) == vassalMaximum and vassalMaximum != GetVassalMinimum() then
        call DisplayTextToPlayer(whichPerson.Player, 0, 0, this.Liege.prefixCol + this.Liege.name + "|r team has too many vassals already. Try picking a different vassal.")
        return
      endif
      set highestValueCP = ControlPoint.GetHighestValueCP(this.Liege.Person)
      if highestValueCP == 0 then
        return
      endif
      call whichPerson.Faction.Leave()
      set whichPerson.Faction = this
      if GetLocalPlayer() == whichPerson.Player then
        call ClearTextMessages()
      endif
      call DisplaySelection()
      call this.legend.Spawn(whichPerson.Player, highestValueCP.X, highestValueCP.Y, 0)
      call UnitDetermineLevel(this.legend.Unit, 0.9)
      set this.legend.StartingXP = GetHeroXP(this.legend.Unit)
      call UnitAddItemById(this.legend.Unit, this.teleportItemType)
      call UnitAddItemById(this.legend.Unit, this.workerItemType)
      if GetLocalPlayer() == whichPerson.Player then
        call PanCameraToTimed(GetUnitX(this.legend.Unit), GetUnitY(this.legend.Unit), 0)
        call ClearSelection()
        call SelectUnit(this.legend.Unit, true)
      endif
      call whichPerson.addGold(VASSAL_STARTING_GOLD)
      call AdjustPlayerStateBJ(VASSAL_STARTING_LUMBER, whichPerson.Player, PLAYER_STATE_RESOURCE_LUMBER)
    endmethod

    private static method OnResearch takes nothing returns nothing
      local integer i = 0
      local integer soldUnitId = GetUnitTypeId(GetSoldUnit())
      loop
        exitwhen i == thistype.count
        if thistype.byIndex[i].legend.UnitType == soldUnitId then
          call thistype.byIndex[i].SelectForPerson(Person.ByHandle(GetOwningPlayer(GetSoldUnit())))
          call RemoveUnit(GetSoldUnit())
        endif
        set i = i + 1
      endloop
    endmethod

    private static method onInit takes nothing returns nothing
      local trigger trig = CreateTrigger()
      call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_SELL)
      call TriggerAddAction(trig, function thistype.OnResearch)
    endmethod
  endstruct

endlibrary