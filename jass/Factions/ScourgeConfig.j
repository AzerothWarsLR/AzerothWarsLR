library ScourgeConfig initializer OnInit requires Faction, TeamConfig

  globals
    LiegeFaction FACTION_SCOURGE
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_SCOURGE = LiegeFaction.create("Scourge", PLAYER_COLOR_PURPLE, "|c00540081","ReplaceableTextures\\CommandButtons\\BTNRevenant.blp", 3)
    set f = FACTION_SCOURGE
    set f.VictoryMusic = "UndeadVictory"
    set f.Team = TEAM_SCOURGE

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
    call f.registerObjectLimit('ugar', 8)           //Gargoyle
    call f.registerObjectLimit('uban', UNLIMITED)   //Banshee
    call f.registerObjectLimit('unec', UNLIMITED)   //Necromancer
    call f.registerObjectLimit('uobs', 2)           //Obsidian Statue
    call f.registerObjectLimit('ufro', 4)           //Frost Wyrm
    call f.registerObjectLimit('nska', UNLIMITED)   //Skeleton Archer
    call f.registerObjectLimit('h00H', 6)           //Death Knight
    call f.registerObjectLimit('ubot', UNLIMITED)   //Undead Transport Ship
    call f.registerObjectLimit('udes', UNLIMITED)   //Undead Frigate
    call f.registerObjectLimit('uubs', 12)          //Undead Battleship
    call f.registerObjectLimit('ubsp', 4)           //Destroyer
    call f.registerObjectLimit('nfgl', 2)           //Plague Titan
    call f.registerObjectLimit('h04A', UNLIMITED)   //Ebon Priest

    //Demi-Heroes
    call f.registerObjectLimit('n04N', 1)           //Lady Deathwhisper 
    call f.registerObjectLimit('ubdd', 1)           //Sapphiron
    call f.registerObjectLimit('uswb', 1)           //Banshee
    call f.registerObjectLimit('h04J', 1)           //Crowley  
    
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
    call f.registerObjectLimit('R00P', UNLIMITED)   //Cold Arrows
    call f.registerObjectLimit('R06L', UNLIMITED)   //Mana Flare
    call f.registerObjectLimit('R06M', UNLIMITED)   //Titanomancy
    call f.registerObjectLimit('R01D', UNLIMITED)   //Piercing Screech
    call f.registerObjectLimit('R06N', UNLIMITED)   //Improved Orb of Annihilation

    call f.registerObjectLimit('R01E', UNLIMITED)   //Gilneas Captured
  endfunction
    
endlibrary