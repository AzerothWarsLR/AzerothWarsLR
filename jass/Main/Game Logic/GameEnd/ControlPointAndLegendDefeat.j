//when a team has 6 or fewer Control Points and no capitals, they are defeated.
library ControlPointAndLegendDefeat initializer OnInit requires VictoryDefeat, ControlPoint, Event, GameTimer

  struct ControlPointAndLegendDefeat
    private static integer CPS_THRESHOLD = 6 //Factions are defeated at this many CPs
    private static boolean initialized = false
    
    public static method operator CPThreshold takes nothing returns integer
      return CPS_THRESHOLD
    endmethod

    private static method CanDefeatTeam takes Team whichTeam returns boolean
      if whichTeam == 0 then
        call BJDebugMsg("ERROR: whichTeam value of 0 passed to CanDefeatTeam")
      endif
      if whichTeam.ControlPointCount < CPS_THRESHOLD and whichTeam.CapitalCount == 0 and whichTeam.ScoreStatus == SCORESTATUS_NORMAL then
        return true
      endif
      return false
    endmethod

    private static method OnControlPointOwnerChanged takes nothing returns nothing
      local Person personLosingCP = Person.ByHandle(GetControlPointPreviousOwner())
      local Team teamLosingCP
      if personLosingCP != 0 then
        set teamLosingCP = personLosingCP.Faction.Team
        if teamLosingCP != 0 then
          if CanDefeatTeam(teamLosingCP) then
            call DefeatTeam(teamLosingCP)
          endif
        endif
      endif
    endmethod

    private static method OnLegendOwnerChanged takes nothing returns nothing
      local Person previousPerson = Person.ById(GetPlayerId(GetLegendPreviousOwner()))
      local Faction previousFaction
      if previousPerson != 0 then
        set previousFaction = Person.ById(GetPlayerId(GetLegendPreviousOwner())).Faction
      endif
      if GetTriggerLegend().IsCapital == true and previousFaction != 0 and CanDefeatTeam(previousFaction.Team) then
        call DefeatTeam(previousFaction.Team)
      endif
    endmethod

    private static method OnLegendPermanentlyDied takes nothing returns nothing
      local Legend triggerLegend = GetTriggerLegend()
      local Team triggerTeam
      if triggerLegend.IsCapital == true and triggerLegend.OwningFaction != 0 and CanDefeatTeam(triggerLegend.OwningFaction.Team) then
        call DefeatTeam(triggerLegend.OwningFaction.Team)
      endif
    endmethod

    static method Initialize takes nothing returns nothing
      local trigger trig
      if not thistype.initialized then
        set trig = CreateTrigger()
        //Control Point changes owner
        call OnControlPointOwnerChange.register(trig)
        call TriggerAddAction(trig, function thistype.OnControlPointOwnerChanged)
        //Legend changes owner
        set trig = CreateTrigger()
        call OnLegendChangeOwner.register(trig)
        call TriggerAddAction(trig, function thistype.OnLegendOwnerChanged)
        //Legend dies
        set trig = CreateTrigger()
        call OnLegendPermaDeath.register(trig)
        call TriggerAddAction(trig, function thistype.OnLegendPermanentlyDied)
        set initialized = true
      else
        call BJDebugMsg("Defeat system is already initialized.")
      endif
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call ControlPointAndLegendDefeat.Initialize()
  endfunction

endlibrary