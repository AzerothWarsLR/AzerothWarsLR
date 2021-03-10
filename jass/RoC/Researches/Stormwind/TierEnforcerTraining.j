library TierEnforcerTraining initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    if GetResearched() == 'R038' then
      call FACTION_STORMWIND.modObjectLimit('h009', -UNLIMITED)      //Brigadier
      call FACTION_STORMWIND.modObjectLimit('h05M', UNLIMITED)       //Enforcer
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