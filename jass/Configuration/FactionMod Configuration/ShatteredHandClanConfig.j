library ShatteredHandClanConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_SHATTEREDHANDCLAN
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_SHATTEREDHANDCLAN = FactionMod.create()
    //Fel Horde tier 1 research, mutually exclusive with Shadow Council Reformed
    call FACTIONMOD_SHATTEREDHANDCLAN.registerObjectLimit('o01H', 6)              //Burning Bladelord
    call FACTIONMOD_SHATTEREDHANDCLAN.registerObjectLimit('o00H', -UNLIMITED)     //Burning Blademaster
    call FACTIONMOD_SHATTEREDHANDCLAN.registerObjectLimit('o01L', 6)              //Shattered Hand Executioner
    call FACTIONMOD_SHATTEREDHANDCLAN.registerObjectLimit('ogrk', 12)             //Forest Troll Warlord
  endfunction
    
endlibrary
