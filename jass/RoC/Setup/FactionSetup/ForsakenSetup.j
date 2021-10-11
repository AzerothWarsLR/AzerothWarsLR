library ForsakenSetup requires Faction, TeamSetup

  globals
    Faction FACTION_FORSAKEN
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_FORSAKEN = Faction.create("Forsaken", PLAYER_COLOR_LIGHT_BLUE, "|cff8080ff","ReplaceableTextures\\CommandButtons\\BTNBansheeRanger.blp", 0)
    set f = FACTION_FORSAKEN
    set f.Team = TEAM_LEGION
    set f.StartingGold = 0
    set f.StartingLumber = 100

    //Buildings
    call f.registerObjectLimit('h089', UNLIMITED)   //Necropolis   
    call f.registerObjectLimit('h08A', UNLIMITED)   //Halls of the Dead 
    call f.registerObjectLimit('h08B', UNLIMITED)   //Black Citadel 
    call f.registerObjectLimit('h08C', UNLIMITED)   //Ziggurat 
    call f.registerObjectLimit('h08D', UNLIMITED)   //Spirit Tower 
    call f.registerObjectLimit('h08E', UNLIMITED)   //Nerubian Tower 
    call f.registerObjectLimit('u010', UNLIMITED)   //Altar of Darkness 
    call f.registerObjectLimit('u011', UNLIMITED)   //Crypt 
    call f.registerObjectLimit('u01J', UNLIMITED)   //Graveyard 
    call f.registerObjectLimit('u016', UNLIMITED)   //Slaughterhouse 
    call f.registerObjectLimit('u01W', UNLIMITED)   //Royal Sepulcur
    call f.registerObjectLimit('u014', UNLIMITED)   //Temple of the Damned    
    call f.registerObjectLimit('u017', UNLIMITED)   //Tomb of Relics   
    call f.registerObjectLimit('u01A', UNLIMITED)   //Undead Shipyard
    call f.registerObjectLimit('h08F', UNLIMITED)   //Improved Spirit Tower
    
    //Units
    call f.registerObjectLimit('u01K', UNLIMITED)   //Acolyte
    call f.registerObjectLimit('h08O', UNLIMITED)   //Ghoul
    call f.registerObjectLimit('h08N', UNLIMITED)   //Abomination
    call f.registerObjectLimit('u01P', 6)           //Plague Catapult
    call f.registerObjectLimit('n07S', UNLIMITED)   //Deadeye
    call f.registerObjectLimit('uban', UNLIMITED)   //Banshee
    call f.registerObjectLimit('h08P', UNLIMITED)   //Sorceress
    call f.registerObjectLimit('u01R', UNLIMITED)   //Apothecary
    call f.registerObjectLimit('n07W', 12)   //Plague Construct
    call f.registerObjectLimit('n07V', 6)           //Elder Banshee
    call f.registerObjectLimit('h009', 6)           //dread knight
    call f.registerObjectLimit('u01V', 2)           //Valyr
    call f.registerObjectLimit('ubot', 12)	    //Undead Transport Ship
    call f.registerObjectLimit('udes', 12) 	    //Undead Frigate
    call f.registerObjectLimit('uubs', 6)          //Undead Battleship

    call f.registerObjectLimit('H049', 1)        //Nathanos
    call f.registerObjectLimit('U01O', 1)        //Putress
    call f.registerObjectLimit('Uvar', 1)        //Varimathras
    call f.registerObjectLimit('Usyl', 1)        //Sylvanas
    
    //Upgrades
    call f.registerObjectLimit('Ruba', UNLIMITED)   //Banshee Adept Training
    call f.registerObjectLimit('R05C', UNLIMITED)   //Banshee Adept Training
    call f.registerObjectLimit('R051', UNLIMITED)   //Apotechary Training
    call f.registerObjectLimit('R02X', UNLIMITED)   // Open Scholomance
  endfunction
    
endlibrary