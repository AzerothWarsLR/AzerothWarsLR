library TierReginaldWindsor initializer OnInit requires StormwindConfig

  private function Research takes nothing returns nothing
    if GetResearched() == 'R03R' then
      call FACTION_STORMWIND.modObjectLimit('n09N', 6)               //Bishop of Light
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
    call FACTION_STORMWIND.modObjectLimit('h03F', 1)
  endfunction

endlibrary