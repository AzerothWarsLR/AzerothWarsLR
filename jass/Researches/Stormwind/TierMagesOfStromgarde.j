library TierMagesOfStromgarde initializer OnInit requires StormwindConfig

  private function Research takes nothing returns nothing
    if GetResearched() == 'R03V' then
      call FACTION_STORMWIND.modObjectLimit('R03X', UNLIMITED)       //High Sorcerer Andromath
      call FACTION_STORMWIND.modObjectLimit('R03Y', UNLIMITED)       //Katrana Prestor    
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary