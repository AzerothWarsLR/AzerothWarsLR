library TierFocusInTheLight initializer OnInit requires StormwindConfig

  private function Research takes nothing returns nothing
    if GetResearched() == 'r03a' then
      call FACTION_STORMWIND.modObjectLimit('R02X', UNLIMITED)       //Holy Mending   
      call FACTION_STORMWIND.modObjectLimit('R03C', UNLIMITED)       //Runic Constitution  
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary