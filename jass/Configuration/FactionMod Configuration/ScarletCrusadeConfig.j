library ScarletCrusadeConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_SCARLETCRUSADE
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_SCARLETCRUSADE = FactionMod.create()
    call FACTIONMOD_SCARLETCRUSADE.registerObjectLimit('h06C', UNLIMITED)       //Halls of Glory 
    call FACTIONMOD_SCARLETCRUSADE.registerObjectLimit('h066', UNLIMITED)       //Scarlet Zealot
    call FACTIONMOD_SCARLETCRUSADE.registerObjectLimit('h069', UNLIMITED)       //Scarlet Battlemage
    call FACTIONMOD_SCARLETCRUSADE.registerObjectLimit('h065', UNLIMITED)       //Scarlet Crusader Knight
    call FACTIONMOD_SCARLETCRUSADE.registerObjectLimit('h067', 8)               //Scarlet Paladin
    call FACTIONMOD_SCARLETCRUSADE.registerObjectLimit('h00T', UNLIMITED)       //Scarlet Monastery
    call FACTIONMOD_SCARLETCRUSADE.registerObjectLimit('h06A', UNLIMITED)       //Inquisitor
    call FACTIONMOD_SCARLETCRUSADE.registerObjectLimit('h06B', UNLIMITED+6)     //Grand Crusader
    call FACTIONMOD_SCARLETCRUSADE.registerObjectLimit('R04F', UNLIMITED)       //Scarlet Mage Initiate Training
    call FACTIONMOD_SCARLETCRUSADE.registerObjectLimit('e011', 8)               //Gryphon Knight
    call FACTIONMOD_SCARLETCRUSADE.registerObjectLimit('hkni', -UNLIMITED)      //Knight
    call FACTIONMOD_SCARLETCRUSADE.registerObjectLimit('h00F', -UNLIMITED)      //Lordaeron Paladin
  endfunction
    
endlibrary
