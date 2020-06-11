library MasteryPlague initializer OnInit requires ScourgeConfig

  private function Research takes nothing returns nothing
    if GetResearched() == 'R01X' then
      call FACTION_SCOURGE.modObjectLimit('nfgl', 2)   //Flesh Golem
      call FACTION_SCOURGE.modObjectLimit('umtw', 2)   //Meat Wagon
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary