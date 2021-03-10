library TierCodeOfChivalry initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    if GetResearched() == 'R030' then
      call FACTION_STORMWIND.modObjectLimit('h01B', -UNLIMITED)      //Outrider
      call FACTION_STORMWIND.modObjectLimit('h054', UNLIMITED)       //Stormwind Knight  
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary