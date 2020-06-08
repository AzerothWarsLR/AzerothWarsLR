library QuelthalasMobilizationConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_QUELTHALASMOBILIZATION
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_QUELTHALASMOBILIZATION = FactionMod.create()
    call FACTIONMOD_QUELTHALASMOBILIZATION.registerObjectLimit('hhes', -UNLIMITED)      //Elven Warrior
    call FACTIONMOD_QUELTHALASMOBILIZATION.registerObjectLimit('nbel', UNLIMITED)       //Blood Elf Warrior
    call FACTIONMOD_QUELTHALASMOBILIZATION.registerObjectLimit('hspt', 12)              //Spell Breaker
    call FACTIONMOD_QUELTHALASMOBILIZATION.registerObjectLimit('n048', 6)               //Blood Mage
    call FACTIONMOD_QUELTHALASMOBILIZATION.registerObjectLimit('nggr', 4)               //Granite Golem       
  endfunction
    
endlibrary
