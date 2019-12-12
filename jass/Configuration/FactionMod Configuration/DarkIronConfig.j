library DarkIronConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_DARKIRON
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_DARKIRON = FactionMod.create()
    call FACTIONMOD_DARKIRON.registerObjectLimit('n02D', UNLIMITED)      //Dark Iron War Golem
    call FACTIONMOD_DARKIRON.registerObjectLimit('h041', 12)             //Fire Tank
  endfunction
    
endlibrary
