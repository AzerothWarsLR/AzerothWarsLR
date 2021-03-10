library TierElectricStrikeRitual initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    if GetResearched() == 'R03T' then
      call FACTION_STORMWIND.modObjectLimit('R03V', UNLIMITED)       //Stromgarde
      call FACTION_STORMWIND.modObjectLimit('R03W', UNLIMITED)       //Honor Hold    
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary