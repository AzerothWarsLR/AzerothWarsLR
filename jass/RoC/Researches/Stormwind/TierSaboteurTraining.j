library TierSaboteurTraining initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    if GetResearched() == 'R03E' then
      call FACTION_STORMWIND.modObjectLimit('h03Z', 12)              //Saboteur      
      call FACTION_STORMWIND.modObjectLimit('R03F', UNLIMITED)       //Assassin Training
      call FACTION_STORMWIND.modObjectLimit('R03K', UNLIMITED)       //Skirmisher Training
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary