library TinkerConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_TINKER
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_TINKER = FactionMod.create()
    call FACTIONMOD_TINKER.registerObjectLimit('h03R', UNLIMITED)      //Tinker
  endfunction
    
endlibrary
