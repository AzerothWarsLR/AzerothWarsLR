library TierEnforcerTraining initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    call FACTION_STORMWIND.modObjectLimit('h009', -UNLIMITED)      //Brigadier
    call FACTION_STORMWIND.modObjectLimit('h05M', UNLIMITED)       //Enforcer
    call FACTION_STORMWIND.modObjectLimit('R03F', UNLIMITED)       //Assassin Training
    call FACTION_STORMWIND.modObjectLimit('R03K', UNLIMITED)       //Skirmisher Training     
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction('R038', function Research)  
  endfunction

endlibrary