//When C'thun captures a Control Point, he gets a Tentacle and a Corruptor.

library CthunCPCapture initializer OnInit requires Event, ControlPoint, AhnqirajConfig

  globals
    private constant integer TENTACLE_ID = 'nfgt'
    private constant integer CORRUPTOR_ID = 'h01N'
  endglobals

  private function Actions takes nothing returns nothing
    local ControlPoint triggerControlPoint = GetTriggerControlPoint()
    local Person tempPerson = Persons[GetPlayerId(triggerControlPoint.owner)]
    local unit tempUnit = null
    if tempPerson.faction == FACTION_AHNQIRAJ then
      set tempUnit = CreateUnit(triggerControlPoint.owner, TENTACLE_ID, GetUnitX(triggerControlPoint.u), GetUnitY(triggerControlPoint.u), 0)
      call QueueUnitAnimation(tempUnit, "birth")
      call QueueUnitAnimation(tempUnit, "stand")
      call CreateUnit(triggerControlPoint.owner, CORRUPTOR_ID, GetUnitX(triggerControlPoint.u), GetUnitY(triggerControlPoint.u), 0)
      set tempUnit = null
    endif

  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnControlPointOwnerChange.register(trig)
    call TriggerAddCondition(trig, Condition(function Actions))
  endfunction

endlibrary