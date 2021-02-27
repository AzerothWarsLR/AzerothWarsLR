library TierSI7Elite initializer OnInit requires StormwindConfig

  private function Research takes nothing returns nothing
    if GetResearched() == 'R032' then
      call FACTION_STORMWIND.modObjectLimit('h05V', 6)                       //SI:7 Agent   
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary