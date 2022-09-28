library TierReflectivePlating initializer OnInit requires StormwindSetup

  private function Research takes nothing returns nothing
    call FACTION_STORMWIND.ModObjectLimit('h04C',UNLIMITED)        //Bladesman
    call FACTION_STORMWIND.ModObjectLimit('h02O',-UNLIMITED)       //Militiaman
    call FACTION_STORMWIND.ModObjectLimit('R030', UNLIMITED)       //Code of Chivalry
    call FACTION_STORMWIND.ModObjectLimit('R031', UNLIMITED)       //Elven Refugees
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterResearchFinishedAction('R02Z', function Research)
  endfunction

endlibrary