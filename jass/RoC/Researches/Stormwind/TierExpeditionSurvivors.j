library TierExpeditionSurvivors initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    if GetResearched() == 'R031' then
      call FACTION_STORMWIND.modObjectLimit('h00A', -UNLIMITED)     //Spearman
      call FACTION_STORMWIND.modObjectLimit('h05N', UNLIMITED)      //Marksman     
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary