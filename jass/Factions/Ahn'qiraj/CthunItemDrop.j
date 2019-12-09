library CthunItemDrop initializer OnInit

  private function Dies takes nothing returns nothing
    if GetUnitTypeId(GetTriggerUnit()) == 'U00R' or GetUnitTypeId(GetTriggerUnit()) == 'n02F' then
      call CreateItem('I00F', GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition(trig, Condition(function Dies))            
  endfunction    

endlibrary