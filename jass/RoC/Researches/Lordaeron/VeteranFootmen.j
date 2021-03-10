library VeteranFootmen initializer OnInit requires Persons, LordaeronSetup

  globals
    private constant integer RESEARCH_ID = 'R00B'
  endglobals

  private function Research takes nothing returns nothing
    if GetResearched() == RESEARCH_ID then
      call FACTION_LORDAERON.modObjectLimit('hfoo', -UNLIMITED)  //Footman
      call FACTION_LORDAERON.modObjectLimit('h029', UNLIMITED)   //Veteran Footman
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary