library SilverHandConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_SILVERHAND
  endglobals

  private function OnInit takes nothing returns nothing  
    local FactionMod f
    
    set f = FactionMod.create()
    call f.registerObjectLimit('h06C', UNLIMITED)       //Halls of Glory 
    call f.registerObjectLimit('n09R', 6)               //Bishop of the Silver Hand
    call f.registerObjectLimit('h063', UNLIMITED)       //Knight of the Silver Hand
    call f.registerObjectLimit('R04C', UNLIMITED)       //Silver Hand Initiate Training
    call f.registerObjectLimit('h06E', UNLIMITED)       //Silver Hand Cleric
    call f.registerObjectLimit('h06D', UNLIMITED+6)     //Silver Hand Veteran Paladin
    call f.registerObjectLimit('h068', 8)               //Silver Hand Cleric
    call f.registerObjectLimit('e011', 8)               //Gryphon Knight
    
    call f.registerObjectLimit('hkni', -UNLIMITED)       //Knight
    call f.registerObjectLimit('h00F', -UNLIMITED)       //Lordaeron Paladin
        
  endfunction
    
endlibrary
