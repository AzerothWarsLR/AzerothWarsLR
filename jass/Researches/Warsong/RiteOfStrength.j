library RiteOfStrength initializer OnInit requires WarsongConfig

  private function Research takes nothing returns nothing
    if GetResearched() == 'R02Q' then
      call CreateUnit(FACTION_WARSONG.Person.p, 'n065', -10448, -9078, 237)
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary