library TierHighSorcererAndromath initializer OnInit requires StormwindConfig

  private function Research takes nothing returns nothing
    if GetResearched() == 'R03X' then
      call FACTION_STORMWIND.modObjectLimit('n05L', 6)               //Conjurer
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary