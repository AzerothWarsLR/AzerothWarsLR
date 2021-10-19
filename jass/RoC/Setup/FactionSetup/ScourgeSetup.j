library ScourgeSetup requires Faction, TeamSetup, UnitTypesScourge

  globals
    Faction FACTION_SCOURGE
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_SCOURGE = Faction.create("Scourge", PLAYER_COLOR_PURPLE, "|c00540081","ReplaceableTextures\\CommandButtons\\BTNRevenant.blp", 0)
    set f = FACTION_SCOURGE
    set f.Team = TEAM_LEGION
    set f.UndefeatedResearch = 'R05K'
    set f.StartingGold = 150
    set f.StartingLumber = 500

    //Buildings
    call f.registerObjectLimit('unpl', UNLIMITED)   //Necropolis   
    call f.registerObjectLimit('unp1', UNLIMITED)   //Halls of the Dead 
    call f.registerObjectLimit('unp2', UNLIMITED)   //Black Citadel 
    call f.registerObjectLimit('uzig', UNLIMITED)   //Ziggurat 
    call f.registerObjectLimit('uzg1', UNLIMITED)   //Spirit Tower 
    call f.registerObjectLimit('uzg2', UNLIMITED)   //Nerubian Tower 
    call f.registerObjectLimit('uaod', UNLIMITED)   //Altar of Darkness 
    call f.registerObjectLimit('usep', UNLIMITED)   //Crypt 
    call f.registerObjectLimit('ugrv', UNLIMITED)   //Graveyard 
    call f.registerObjectLimit('uslh', UNLIMITED)   //Slaughterhouse 
    call f.registerObjectLimit('utod', UNLIMITED)   //Temple of the Damned 
    call f.registerObjectLimit('ubon', UNLIMITED)   //Boneyard      
    call f.registerObjectLimit('utom', UNLIMITED)   //Tomb of Relics   
    call f.registerObjectLimit('ushp', UNLIMITED)   //Undead Shipyard
    call f.registerObjectLimit('u002', UNLIMITED)   //Improved Spirit Tower
    call f.registerObjectLimit('u003', UNLIMITED)   //Improved Nerubian Tower
    
    //Units
    call f.registerObjectLimit('uaco', UNLIMITED)   //Acolyte
    call f.registerObjectLimit('ushd', UNLIMITED)   //Shade
    call f.registerObjectLimit('ugho', UNLIMITED)   //Ghoul
    call f.registerObjectLimit('uabo', UNLIMITED)   //Abomination
    call f.registerObjectLimit('umtw', 6)           //Meat Wagon
    call f.registerObjectLimit('ucry', UNLIMITED)   //Crypt Fiend
    call f.registerObjectLimit('ugar', 12)           //Gargoyle
    call f.registerObjectLimit('h02G', UNLIMITED)   //Vrykul Warrior
    call f.registerObjectLimit('h061', 12)           //Vrykul Champion
    call f.registerObjectLimit('h00P', 4)           //Mammoth rider
    call f.registerObjectLimit('uban', UNLIMITED)   //Banshee
    call f.registerObjectLimit('unec', UNLIMITED)   //Necromancer
    call f.registerObjectLimit('uobs', 4)           //Obsidian Statue
    call f.registerObjectLimit('ufro', 4)           //Frost Wyrm
    call f.registerObjectLimit('h00H', 6)           //Death Knight
    call f.registerObjectLimit('ubot', 12)	    //Undead Transport Ship
    call f.registerObjectLimit('udes', 12) 	    //Undead Frigate
    call f.registerObjectLimit('uubs', 6)          //Undead Battleship
    call f.registerObjectLimit('ubsp', 4)           //Destroyer
    call f.registerObjectLimit('nfgl', 2)           //Plague Titan

    //Demi-Heroes
    call f.registerObjectLimit('ubdd', 1)           //Sapphiron
    call f.registerObjectLimit('uswb', 1)           //Banshee
    call f.registerObjectLimit('Uanb', 1)           //Anubarak
    call f.registerObjectLimit('U001', 1)           //Keltuzad
    call f.registerObjectLimit('U00A', 1)           //Rivendare
    
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
    call f.registerObjectLimit('R01D', UNLIMITED)   //Piercing Screech
    call f.registerObjectLimit('R06N', UNLIMITED)   //Improved Orb of Annihilation
    call f.registerObjectLimit('Rusl', UNLIMITED)   //SkeletalMastery
    call f.registerObjectLimit('Rusm', UNLIMITED)   //SkeletalLongevity
  endfunction
    
endlibrary