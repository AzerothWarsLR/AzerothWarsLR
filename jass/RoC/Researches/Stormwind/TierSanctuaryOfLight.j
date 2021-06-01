library TierSanctuaryOfLight initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    call FACTION_STORMWIND.modObjectLimit('R02X', UNLIMITED)       //Holy Mending   
    call FACTION_STORMWIND.modObjectLimit('R03C', UNLIMITED)       //Runic Constitution     
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction('R02W', function Research)
  endfunction

endlibrary