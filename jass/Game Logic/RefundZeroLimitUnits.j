//If a unit with a tech limit of 0 is trained, delete and refund it instantly.

library RefundZeroLimitUnits initializer OnInit requires Persons, UnitType

  private function Trained takes nothing returns nothing
    local unit u = GetTrainedUnit()
    local player p = GetOwningPlayer(u)
    local Person tempPerson = Persons[GetPlayerId(p)]
    local UnitType tempUnitType = 0
    if tempPerson.objectLimits[GetUnitTypeId(u)] == 0 then
      set tempUnitType = UnitTypes[GetUnitTypeId(u)]
      if tempUnitType != 0 then
        call AdjustPlayerStateSimpleBJ(p, PLAYER_STATE_RESOURCE_GOLD, tempUnitType.goldCost)
        call AdjustPlayerStateSimpleBJ(p, PLAYER_STATE_RESOURCE_LUMBER, tempUnitType.lumberCost)
      endif
      call RemoveUnit(u)
    endif
    set u = null
    set p = null
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_TRAIN_FINISH )
    call TriggerAddCondition(trig, Condition(function Trained))       
  endfunction

endlibrary