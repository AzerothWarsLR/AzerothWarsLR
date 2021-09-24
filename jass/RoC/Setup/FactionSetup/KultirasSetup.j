library KultirasSetup requires Faction, TeamSetup

  globals
    Faction FACTION_KULTIRAS
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_KULTIRAS = Faction.create("Kul'tiras", PLAYER_COLOR_EMERALD, "|cff00781e", "ReplaceableTextures\\CommandButtons\\BTNProudmoore.blp", 0)
    set f = FACTION_KULTIRAS
    set f.Team = TEAM_ALLIANCE
    set f.StartingGold = 150
    set f.StartingLumber = 500

    //Structures
    call f.registerObjectLimit('h062', UNLIMITED)   //Town Hall
    call f.registerObjectLimit('h064', UNLIMITED)   //Keep
    call f.registerObjectLimit('h06I', UNLIMITED)   //Castle
    call f.registerObjectLimit('h07N', UNLIMITED)   //Farm
    call f.registerObjectLimit('h07M', UNLIMITED)   //Altar
    call f.registerObjectLimit('h07R', UNLIMITED)   //Scout Tower
    call f.registerObjectLimit('h07S', UNLIMITED)   //Guard Tower
    call f.registerObjectLimit('h07T', UNLIMITED)   //Improved Guard Tower
    call f.registerObjectLimit('h04U', UNLIMITED)   //Cannon Tower
    call f.registerObjectLimit('h07V', UNLIMITED)   //Improved Cannon Tower
    call f.registerObjectLimit('h07O', UNLIMITED)   //Blacksmith
    call f.registerObjectLimit('h07Q', UNLIMITED)   //Arcane Sanctum
    call f.registerObjectLimit('n07H', UNLIMITED)   //Marketplace
    call f.registerObjectLimit('h07W', UNLIMITED)   //Shipyard
    call f.registerObjectLimit('h06R', UNLIMITED)   //Garrison
    call f.registerObjectLimit('h07P', UNLIMITED)   //Workshop
    
    //Units
    call f.registerObjectLimit('h01E', UNLIMITED)   //Deckhand
    call f.registerObjectLimit('hbot', UNLIMITED)   //Alliance Transport Ship
    call f.registerObjectLimit('hdes', UNLIMITED)   //Alliance Frigate
    call f.registerObjectLimit('h04J', 5)           //Warship
    call f.registerObjectLimit('e007', UNLIMITED)   //Thornspeaker
    call f.registerObjectLimit('h05K', UNLIMITED)   //Tidesage
    call f.registerObjectLimit('h041', UNLIMITED)   //Marine
    call f.registerObjectLimit('e00B', UNLIMITED)   //Thornspeaker Bear
    call f.registerObjectLimit('n009', UNLIMITED)   //Revenant of the Tides
    call f.registerObjectLimit('n07G', 6)           //muskateer
    call f.registerObjectLimit('n029', 12)          //Sea Giant
    call f.registerObjectLimit('h06J', UNLIMITED)   //Sniper
    call f.registerObjectLimit('o01A', 6)           //Cannon Team
    call f.registerObjectLimit('h04O', 12)          //Bomber
    call f.registerObjectLimit('h04W', 3)           //Siege Tank

    //Upgrades
    call f.registerObjectLimit('R001', UNLIMITED)   //Rising Tides
    call f.registerObjectLimit('R000', UNLIMITED)   //Tidesage Adept Training
    call f.registerObjectLimit('R01O', UNLIMITED)   //Crushing Wave
    call f.registerObjectLimit('R01T', UNLIMITED)   //Cluster Rockets
    call f.registerObjectLimit('R01U', UNLIMITED)   //Improved Barrage
    call f.registerObjectLimit('R05G', UNLIMITED)   //Thornspeaker Training

    //Heroes
    call f.registerObjectLimit('Hapm', 1)           //Admiral
    call f.registerObjectLimit('H05L', 1)           //Lady Ashvane

  endfunction
    
endlibrary