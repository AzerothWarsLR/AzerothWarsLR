library TierRunicConstitution initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    if GetResearched() == 'R03C' then
      call FACTION_STORMWIND.modObjectLimit('R03R', UNLIMITED)       //Reginald Windsor 
      call FACTION_STORMWIND.modObjectLimit('R03P', UNLIMITED)       //Archbishop Benedictus   
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary