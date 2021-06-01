library TierExpeditionSurvivors initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    call FACTION_STORMWIND.modObjectLimit('h00A', -UNLIMITED)     //Spearman
    call FACTION_STORMWIND.modObjectLimit('h05N', UNLIMITED)      //Marksman     
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction('R031', function Research)
  endfunction

endlibrary