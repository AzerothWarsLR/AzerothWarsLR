library MasteryShipwrightGuild initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    if GetResearched() == 'R00Z' then
      call FACTION_STORMWIND.modObjectLimit('h060', 1)   //Arathor Flagship
      call FACTION_STORMWIND.modObjectLimit('h024', UNLIMITED)   //Light House
      call FACTION_STORMWIND.modObjectLimit('h061', UNLIMITED)   //Naval Outpost  
      call EnableTrigger( gg_trg_Flagship_Construction )
      call EnableTrigger( gg_trg_Bombing_Run ) 
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary