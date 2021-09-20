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
    call f.registerObjectLimit('n07W', UNLIMITED)   //Plague Construct
    call f.registerObjectLimit('n07V', 6)           //Elder Banshee
    call f.registerObjectLimit('ubot', 24)	    //Undead Transport Ship
    call f.registerObjectLimit('udes', 24) 	    //Undead Frigate
    call f.registerObjectLimit('uubs', 12)          //Undead Battleship

    call f.registerObjectLimit('H049', 1)        //Nathanos
    call f.registerObjectLimit('U01O', 1)        //Putress
    call f.registerObjectLimit('Uvar', 1)        //Varimathras
    call f.registerObjectLimit('Usyl', 1)        //Sylvanas
    
    //Upgrades
    call f.registerObjectLimit('Ruba', UNLIMITED)   //Banshee Adept Training
    call f.registerObjectLimit('Rubu', UNLIMITED)   //Burrow
    call f.registerObjectLimit('Ruex', UNLIMITED)   //Exhume Corpses
    call f.registerObjectLimit('Rufb', UNLIMITED)   //Freezing Breath
    call f.registerObjectLimit('Rugf', UNLIMITED)   //Ghoul Frenzy
    call f.registerObjectLimit('Rune', UNLIMITED)   //Necromancer Adept Training
    call f.registerObjectLimit('Ruwb', UNLIMITED)   //Web
    call f.registerObjectLimit('R02A', UNLIMITED)   //Chaos Infusion
    call f.registerObjectLimit('R00Q', UNLIMITED)   //Chilling Aura
    call f.registerObjectLimit('R04V', UNLIMITED)   //Improved Hypothermic Breath
    call f.registerObjectLimit('R01X', UNLIMITED)   //Epidemic
    call f.registerObjectLimit('R06M', UNLIMITED)   //Titanomancy
    call f.registerObjectLimit('R01D', UNLIMITED)   //Piercing Screech
    call f.registerObjectLimit('R06N', UNLIMITED)   //Improved Orb of Annihilation
    call f.registerObjectLimit('Rusl', UNLIMITED)   //SkeletalMastery
    call f.registerObjectLimit('Rusm', UNLIMITED)   //SkeletalLongevity
    call f.registerObjectLimit('R02X', UNLIMITED)   // Open Scholomance
  endfunction
    
endlibrary