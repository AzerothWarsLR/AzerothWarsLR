library RiteOfBloodConfig initializer OnInit requires FactionMod

  globals
    FactionMod FACTIONMOD_RITEOFBLOOD
  endglobals

  private function OnInit takes nothing returns nothing  
    set FACTIONMOD_RITEOFBLOOD = FactionMod.create()
    //Note that the parent factions have -UNLIMITED+x Blademasters, so combined with this you get +x Blademasters
    call FACTIONMOD_RITEOFBLOOD.registerObjectLimit('o00G', UNLIMITED)           //Blademaster
  endfunction
    
endlibrary
