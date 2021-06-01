library TierAssassinTraining initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    call FACTION_STORMWIND.modObjectLimit('h00A', -UNLIMITED)      //Spearman
    call FACTION_STORMWIND.modObjectLimit('h05T', UNLIMITED)       //Assassin
    call FACTION_STORMWIND.modObjectLimit('R032', UNLIMITED)       //SI:7 Elite Training
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction('R03F', function Research)
  endfunction

endlibrary