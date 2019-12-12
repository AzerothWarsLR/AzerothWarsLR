library WildhammerConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_WILDHAMMER
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_WILDHAMMER = FactionMod.create()
    call FACTIONMOD_WILDHAMMER.registerObjectLimit('n04F', UNLIMITED)      //Wildhammer War Golem
    call FACTIONMOD_WILDHAMMER.registerObjectLimit('hgry', 3)              //Gryphon Rider
  endfunction
    
endlibrary