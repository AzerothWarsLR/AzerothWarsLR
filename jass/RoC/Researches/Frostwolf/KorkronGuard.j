library KorkronGuard initializer OnInit requires FrostwolfSetup

  globals
    private constant integer RESEARCH_ID = 'R017'
  endglobals

  private function Research takes nothing returns nothing
    if GetResearched() == RESEARCH_ID then
      call FACTION_FROSTWOLF.modObjectLimit('ogru', -UNLIMITED)  //Grunt
      call FACTION_FROSTWOLF.modObjectLimit('o01K', UNLIMITED)   //Korkon Guard
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary