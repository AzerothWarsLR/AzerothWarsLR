library TierRunicConstitution initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    call FACTION_STORMWIND.modObjectLimit('R03R', UNLIMITED)       //Reginald Windsor 
    call FACTION_STORMWIND.modObjectLimit('R03P', UNLIMITED)       //Archbishop Benedictus   
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction('R03C', function Research)
  endfunction

endlibrary