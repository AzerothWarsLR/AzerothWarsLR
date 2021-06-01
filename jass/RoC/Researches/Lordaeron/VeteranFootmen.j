library VeteranFootmen initializer OnInit requires Persons, LordaeronSetup

  globals
    private constant integer RESEARCH_ID = 'R00B'
  endglobals

  private function Research takes nothing returns nothing
    call FACTION_LORDAERON.modObjectLimit('hfoo', -UNLIMITED)  //Footman
    call FACTION_LORDAERON.modObjectLimit('h029', UNLIMITED)   //Veteran Footman
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction(RESEARCH_ID, function Research)
  endfunction

endlibrary