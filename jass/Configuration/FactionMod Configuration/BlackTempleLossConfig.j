library BlackTempleLossConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_BLACKTEMPLELOSS
  endglobals

  //Fel Horde loses the Black Temple
  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_BLACKTEMPLELOSS = FactionMod.create()
    call FACTIONMOD_BLACKTEMPLELOSS.registerObjectLimit('o01H', -UNLIMITED)      //Burning Bladelord
    call FACTIONMOD_BLACKTEMPLELOSS.registerObjectLimit('o00H', -UNLIMITED)      //Burning Blademaster
    call FACTIONMOD_BLACKTEMPLELOSS.registerObjectLimit('o01L', -UNLIMITED)      //Shattered Hand Executioner
  endfunction
    
endlibrary
