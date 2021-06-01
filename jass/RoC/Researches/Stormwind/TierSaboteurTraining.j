library TierSaboteurTraining initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    call FACTION_STORMWIND.modObjectLimit('h03Z', 12)              //Saboteur      
    call FACTION_STORMWIND.modObjectLimit('R03F', UNLIMITED)       //Assassin Training
    call FACTION_STORMWIND.modObjectLimit('R03K', UNLIMITED)       //Skirmisher Training
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction('R03E', function Research)
  endfunction

endlibrary