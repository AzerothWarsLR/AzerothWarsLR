library MalganisModConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_MALGANIS
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_MALGANIS = FactionMod.create()
    call FACTIONMOD_MALGANIS.registerObjectLimit('u01A', -UNLIMITED)      //Mal'ganis
  endfunction
    
endlibrary
