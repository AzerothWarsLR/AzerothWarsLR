library TierReflectivePlating initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    if GetResearched() == 'R02Z' then
      call FACTION_STORMWIND.modObjectLimit('h04C',UNLIMITED)        //Bladesman
      call FACTION_STORMWIND.modObjectLimit('h02O',-UNLIMITED)       //Militiaman
      call FACTION_STORMWIND.modObjectLimit('R030', UNLIMITED)       //Code of Chivalry
      call FACTION_STORMWIND.modObjectLimit('R031', UNLIMITED)       //Elven Refugees               
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary