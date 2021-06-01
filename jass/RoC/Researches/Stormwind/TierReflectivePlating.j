library TierReflectivePlating initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    call FACTION_STORMWIND.modObjectLimit('h04C',UNLIMITED)        //Bladesman
    call FACTION_STORMWIND.modObjectLimit('h02O',-UNLIMITED)       //Militiaman
    call FACTION_STORMWIND.modObjectLimit('R030', UNLIMITED)       //Code of Chivalry
    call FACTION_STORMWIND.modObjectLimit('R031', UNLIMITED)       //Elven Refugees
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction('R02Z', function Research)
  endfunction

endlibrary