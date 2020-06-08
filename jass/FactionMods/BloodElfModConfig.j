library BloodElfModConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_BLOODELVES
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_BLOODELVES = FactionMod.create()
    call FACTIONMOD_BLOODELVES.registerObjectLimit('hhes', -UNLIMITED)      //Elven Warrior
    call FACTIONMOD_BLOODELVES.registerObjectLimit('nbel', UNLIMITED)       //Blood Elf Warrior
    call FACTIONMOD_BLOODELVES.registerObjectLimit('hspt', 12)              //Spell Breaker
    call FACTIONMOD_BLOODELVES.registerObjectLimit('n048', 6)               //Blood Mage
    call FACTIONMOD_BLOODELVES.registerObjectLimit('n00A', -6)              //Farstrider
    call FACTIONMOD_BLOODELVES.registerObjectLimit('n063', -UNLIMITED)      //Magus 
    call FACTIONMOD_BLOODELVES.registerObjectLimit('R029', -UNLIMITED)      //Magus Adept Training
  endfunction
    
endlibrary
