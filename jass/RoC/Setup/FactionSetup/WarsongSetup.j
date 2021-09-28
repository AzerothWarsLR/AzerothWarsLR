library WarsongSetup requires Faction, TeamSetup
  globals
    Faction FACTION_WARSONG
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f

    set FACTION_WARSONG = Faction.create("Warsong", PLAYER_COLOR_ORANGE, "|c00ff8000","ReplaceableTextures\\CommandButtons\\BTNHellScream.blp", 0)
    set f = FACTION_WARSONG
    set f.Team = TEAM_HORDE
    set f.UndefeatedResearch = 'R05W'
    set f.StartingGold = 150
    set f.StartingLumber = 500

    call f.registerObjectLimit('o00C', UNLIMITED)   //Great Hall
    call f.registerObjectLimit('o02R', UNLIMITED)   //Stronghold
    call f.registerObjectLimit('o02S', UNLIMITED)   //Fortress
    call f.registerObjectLimit('o020', UNLIMITED)   //Altar of Storms
    call f.registerObjectLimit('o01S', UNLIMITED)   //Barracks
    call f.registerObjectLimit('o009', UNLIMITED)   //War Mill
    call f.registerObjectLimit('o006', UNLIMITED)   //Ogre Barrack
    call f.registerObjectLimit('o02Q', UNLIMITED)   //Bestiary
    call f.registerObjectLimit('o028', UNLIMITED)   //Orc Burrow
    call f.registerObjectLimit('n03E', UNLIMITED)   //Watch Tower
    call f.registerObjectLimit('o01H', UNLIMITED)   //Troll Shrine
    call f.registerObjectLimit('n0AL', UNLIMITED)   //Improved Watch Tower
    call f.registerObjectLimit('o02T', UNLIMITED)   //Shipyard
    call f.registerObjectLimit('o01T', UNLIMITED)   //Goblin Hardware Shop

    call f.registerObjectLimit('o04L', UNLIMITED)   //Peon
    call f.registerObjectLimit('o02M', UNLIMITED)   //Grunt
    call f.registerObjectLimit('orai', UNLIMITED)   //Raider
    call f.registerObjectLimit('n08E', UNLIMITED)   //Hexbinder
    call f.registerObjectLimit('otbk', UNLIMITED)   //Troll Berseker
    call f.registerObjectLimit('nogn', UNLIMITED)   //Stonemaul Ogre Magi
    call f.registerObjectLimit('o00I', 6)           //Horde War Machine
    call f.registerObjectLimit('okod', 4)           //Kodo Beast
    call f.registerObjectLimit('obot', 24)   	    //Transport Ship
    call f.registerObjectLimit('odes', 24)  	     //Orc Frigate
    call f.registerObjectLimit('ojgn', 12)          //Juggernaught
    call f.registerObjectLimit('o021', 12)          //Ravager
    call f.registerObjectLimit('nftk', 12)          //Warlord
    call f.registerObjectLimit('o00G', 6)           //Blademaster
    call f.registerObjectLimit('n03F', 6)           //Korkron elite
    call f.registerObjectLimit('o02K', 6)           //Bear Rider
    call f.registerObjectLimit('owyv', 8)           //Wind Rider

    call f.registerObjectLimit('Robs', UNLIMITED)   //Berserker Strength
    call f.registerObjectLimit('Rotr', UNLIMITED)   //Troll Regeneration
    call f.registerObjectLimit('R023', UNLIMITED)   //Spiritual Infusion
    call f.registerObjectLimit('R01J', UNLIMITED)   //Ensnare
    call f.registerObjectLimit('R02I', UNLIMITED)   //Ogre Magi Adept Training
    call f.registerObjectLimit('R03Q', UNLIMITED)   //Warlock Adept Training
    call f.registerObjectLimit('Rorb', UNLIMITED)   //Reinforced Defenses
    call f.registerObjectLimit('Rosp', UNLIMITED)   //Spiked Barricades
    call f.registerObjectLimit('R016', UNLIMITED)   //Warlords
    call f.registerObjectLimit('R019', UNLIMITED)   //Improved Shockwave
    call f.registerObjectLimit('R01Z', UNLIMITED)   //Battle Stations
    call f.SetObjectLevel('R01Z', 1)                //Battle Stations
    call f.registerObjectLimit('R00D', UNLIMITED)   //For the Horde!
    call f.registerObjectLimit('Rovs', UNLIMITED)   //Envenomed Spears
    call f.registerObjectLimit('R017', UNLIMITED)   //Improved Ignore Pain
  endfunction

endlibrary