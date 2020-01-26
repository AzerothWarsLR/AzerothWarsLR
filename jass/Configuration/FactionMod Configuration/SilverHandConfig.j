library SilverHandConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_SILVERHAND
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_SILVERHAND = FactionMod.create()
    call FACTIONMOD_SILVERHAND.registerObjectLimit('h06C', UNLIMITED)       //Halls of Glory 
    call FACTIONMOD_SILVERHAND.registerObjectLimit('n09R', 6)               //Bishop of the Silver Hand
    call FACTIONMOD_SILVERHAND.registerObjectLimit('h063', UNLIMITED)       //Knight of the Silver Hand
    call FACTIONMOD_SILVERHAND.registerObjectLimit('R04C', UNLIMITED)       //Silver Hand Initiate Training
    call FACTIONMOD_SILVERHAND.registerObjectLimit('h06E', UNLIMITED)       //Silver Hand Cleric
    call FACTIONMOD_SILVERHAND.registerObjectLimit('h06D', UNLIMITED+6)     //Silver Hand Veteran Paladin
    call FACTIONMOD_SILVERHAND.registerObjectLimit('h068', 8)               //Silver Hand Cleric
    call FACTIONMOD_SILVERHAND.registerObjectLimit('e011', 8)               //Gryphon Knight
    
    call FACTIONMOD_SILVERHAND.registerObjectLimit('hkni', -UNLIMITED)       //Knight
    call FACTIONMOD_SILVERHAND.registerObjectLimit('h00F', -UNLIMITED)       //Lordaeron Paladin 
  endfunction
    
endlibrary
