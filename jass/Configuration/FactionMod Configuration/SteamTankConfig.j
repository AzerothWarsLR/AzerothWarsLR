library SteamTankConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_STEAMTANK
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_STEAMTANK = FactionMod.create()
    call FACTIONMOD_STEAMTANK.registerObjectLimit('h01P', 3)           //Steam Tank
    call FACTIONMOD_STEAMTANK.registerObjectLimit('h03R', UNLIMITED)   //Tinker
  endfunction
    
endlibrary
