library TierElectricStrikeRitual initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    call FACTION_STORMWIND.modObjectLimit('R03V', UNLIMITED)       //Stromgarde
    call FACTION_STORMWIND.modObjectLimit('R03W', UNLIMITED)       //Honor Hold    
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction('R03T', function Research)
  endfunction

endlibrary