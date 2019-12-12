library KultirasConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_KULTIRAS
  endglobals

private function OnInit takes nothing returns nothing  
    set FACTIONMOD_KULTIRAS = FactionMod.create()
    call FACTIONMOD_KULTIRAS.registerObjectLimit('h06G', UNLIMITED)   //Kul Tiras Barracks
    call FACTIONMOD_KULTIRAS.registerObjectLimit('h01H', 6)           //Fleet Commander
    call FACTIONMOD_KULTIRAS.registerObjectLimit('h06F', 24)          //Kul Tiras Rifleman
    call FACTIONMOD_KULTIRAS.registerObjectLimit('o01A', 8)           //Naval Cannon        
  endfunction
    
endlibrary
