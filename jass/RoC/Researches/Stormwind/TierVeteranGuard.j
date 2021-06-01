library TierVeteranGuard initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    call FACTION_STORMWIND.modObjectLimit('h03K', -UNLIMITED)      //Marshal
    call FACTION_STORMWIND.modObjectLimit('h03U', 12)              //Marshal (Defensive)
    call FACTION_STORMWIND.modObjectLimit('R03B', UNLIMITED)       //Exploit Weakness
    call FACTION_STORMWIND.modObjectLimit('R02Z', UNLIMITED)       //Reflective Plating     
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction('R03D', function Research) 
  endfunction

endlibrary