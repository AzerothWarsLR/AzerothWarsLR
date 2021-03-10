library TierAssassinTraining initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    if GetResearched() == 'R03F' then
      call FACTION_STORMWIND.modObjectLimit('h00A', -UNLIMITED)      //Spearman
      call FACTION_STORMWIND.modObjectLimit('h05T', UNLIMITED)       //Assassin
      call FACTION_STORMWIND.modObjectLimit('R032', UNLIMITED)       //SI:7 Elite Training
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary