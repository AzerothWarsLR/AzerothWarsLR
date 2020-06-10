library ShadowCouncilReformedConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_SHADOWCOUNCILREFORMED
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_SHADOWCOUNCILREFORMED = FactionMod.create()
    call FACTIONMOD_SHADOWCOUNCILREFORMED.registerObjectLimit('o01H', -UNLIMITED)     //Burning Bladelord
    call FACTIONMOD_SHADOWCOUNCILREFORMED.registerObjectLimit('o00H', -UNLIMITED)     //Burning Blademaster
    call FACTIONMOD_SHADOWCOUNCILREFORMED.registerObjectLimit('n086', 6)              //Death Knight
  endfunction
    
endlibrary
