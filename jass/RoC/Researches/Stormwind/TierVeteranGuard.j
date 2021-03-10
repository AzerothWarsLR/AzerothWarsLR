library TierVeteranGuard initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    if GetResearched() == 'R03D' then
      call FACTION_STORMWIND.modObjectLimit('h03K', -UNLIMITED)      //Marshal
      call FACTION_STORMWIND.modObjectLimit('h03U', 12)              //Marshal (Defensive)
      call FACTION_STORMWIND.modObjectLimit('R03B', UNLIMITED)       //Exploit Weakness
      call FACTION_STORMWIND.modObjectLimit('R02Z', UNLIMITED)       //Reflective Plating     
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary