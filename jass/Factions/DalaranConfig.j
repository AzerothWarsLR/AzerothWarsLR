library DalaranConfig initializer OnInit requires Faction, TeamConfig

  globals
    LiegeFaction FACTION_DALARAN
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_DALARAN = LiegeFaction.create("Dalaran", PLAYER_COLOR_PINK, "|c00e55bb0","ReplaceableTextures\\CommandButtons\\BTNJaina.blp", 2)
    set f = FACTION_DALARAN 
    set f.VictoryMusic = "HumanVictory"
    set f.Team = TEAM_NORTH_ALLIANCE
    
    //Structures
    call f.registerObjectLimit('htow', UNLIMITED)   //Town Hall
    call f.registerObjectLimit('hkee', UNLIMITED)   //Keep
    call f.registerObjectLimit('hcas', UNLIMITED)   //Castle
    call f.registerObjectLimit('hhou', UNLIMITED)   //Farm
    call f.registerObjectLimit('halt', UNLIMITED)   //Altar of Kings
    call f.registerObjectLimit('hbar', UNLIMITED)   //Barracks
    call f.registerObjectLimit('hlum', UNLIMITED)   //Lumber Mill
    call f.registerObjectLimit('hbla', UNLIMITED)   //Blacksmith
    call f.registerObjectLimit('hars', UNLIMITED)   //Arcane Sanctum
    call f.registerObjectLimit('hwtw', UNLIMITED)   //Scout Tower
    call f.registerObjectLimit('hatw', UNLIMITED)   //Arcane Tower
    call f.registerObjectLimit('h008', UNLIMITED)   //Arcane Tower (Improved)
    call f.registerObjectLimit('hvlt', UNLIMITED)   //Arcane Vault
    call f.registerObjectLimit('hshy', UNLIMITED)   //Alliance Shipyard
    call f.registerObjectLimit('ndgt', UNLIMITED)   //Dalaran Tower
    call f.registerObjectLimit('n004', UNLIMITED)   //Dalaran Tower (Improved)

    //Units
    call f.registerObjectLimit('h022', UNLIMITED)   //Shaper
    call f.registerObjectLimit('hbot', UNLIMITED)   //Alliance Transport Ship
    call f.registerObjectLimit('hdes', UNLIMITED)   //Alliance Frigate
    call f.registerObjectLimit('hbsh', 12)          //Alliance Battle Ship
    call f.registerObjectLimit('nhym', UNLIMITED)   //Hydromancer
    call f.registerObjectLimit('h033', UNLIMITED)   //Militia 
    call f.registerObjectLimit('h032', UNLIMITED)   //Battlemage
    call f.registerObjectLimit('h034', UNLIMITED)   //Tirasian Archer
    call f.registerObjectLimit('h02D', UNLIMITED)   //Geomancer
    call f.registerObjectLimit('h01I', UNLIMITED)   //Arcanist
    call f.registerObjectLimit('n007', 6)           //Kirin Tor
    call f.registerObjectLimit('n096', 6)           //Earth Golem
    call f.registerObjectLimit('n03E', UNLIMITED)   //Pyromancer
    call f.registerObjectLimit('h02C', 1)           //Flagship 

    //Demi-heroes
    call f.registerObjectLimit('njks', 1)           //Jailor Kassan

    //Upgrades
    call f.registerObjectLimit('R01I', UNLIMITED)   //Arcanist Adept Training
    call f.registerObjectLimit('R01V', UNLIMITED)   //Geomancer Adept Training
    call f.registerObjectLimit('R00E', UNLIMITED)   //Hydromancer Adept Training
    call f.registerObjectLimit('R01L', UNLIMITED)   //Magic Sentry
    call f.registerObjectLimit('R00K', UNLIMITED)   //Power Infusion
    call f.registerObjectLimit('R00D', UNLIMITED)   //Pyromancer Adept Training
    call f.registerObjectLimit('Rhlh', UNLIMITED)   //Improved Lumber Harvesting
    call f.registerObjectLimit('Rhac', UNLIMITED)   //Improved Masonry

    //Masteries
    call f.registerObjectLimit('R00L', UNLIMITED)   //Arcane Mastery
    call f.registerObjectLimit('R00N', UNLIMITED)   //Elemental Mastery
    call f.registerObjectLimit('R00J', UNLIMITED)   //Magical Wrath Mastery
    
    //Paths
    call f.registerObjectLimit('R03O', UNLIMITED)   //Path of Steel
  endfunction
    
endlibrary