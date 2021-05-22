library KultirasSetup requires Faction, TeamSetup

  globals
    Faction FACTION_KULTIRAS
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_KULTIRAS = Faction.create("Kul'tiras", PLAYER_COLOR_EMERALD, "|cff00781e", "ReplaceableTextures\\CommandButtons\\BTNProudmoore.blp", 3)
    set f = FACTION_KULTIRAS
    set f.Team = TEAM_SOUTH_ALLIANCE

    //Structures
    call f.registerObjectLimit('h01R', UNLIMITED)   //Town Hall
    call f.registerObjectLimit('h023', UNLIMITED)   //Keep
    call f.registerObjectLimit('h02C', UNLIMITED)   //Castle
    call f.registerObjectLimit('h02F', UNLIMITED)   //Farm
    call f.registerObjectLimit('h02X', UNLIMITED)   //Altar
    call f.registerObjectLimit('h039', UNLIMITED)   //Scout Tower
    call f.registerObjectLimit('h03A', UNLIMITED)   //Guard Tower
    call f.registerObjectLimit('h03B', UNLIMITED)   //Cannon Tower
    call f.registerObjectLimit('h03C', UNLIMITED)   //Blacksmith
    call f.registerObjectLimit('h03D', UNLIMITED)   //Arcane Sanctum
    call f.registerObjectLimit('h03E', UNLIMITED)   //Keep
    call f.registerObjectLimit('n008', UNLIMITED)   //Marketplace
    call f.registerObjectLimit('h03H', UNLIMITED)   //Shipyard
    call f.registerObjectLimit('h03O', UNLIMITED)   //Blacksmith
    call f.registerObjectLimit('h03Q', UNLIMITED)   //Garrison
    
    //Units
    call f.registerObjectLimit('h01E', UNLIMITED)   //Deckhand
    call f.registerObjectLimit('hbot', UNLIMITED)   //Alliance Transport Ship
    call f.registerObjectLimit('hdes', UNLIMITED)   //Alliance Frigate
    call f.registerObjectLimit('h04J', 5)           //Warship
    call f.registerObjectLimit('e007', UNLIMITED)   //Thornspeaker
    call f.registerObjectLimit('h04M', UNLIMITED)   //Tidesage
    call f.registerObjectLimit('h041', UNLIMITED)   //Marine
    call f.registerObjectLimit('n009', UNLIMITED)   //Revenant of the Tides
    call f.registerObjectLimit('n03L', 6)           //Storm Sorcerer
    call f.registerObjectLimit('n029', 12)          //Sea Giant
    call f.registerObjectLimit('h04N', UNLIMITED)   //Musketeer
    call f.registerObjectLimit('o01A', 6)           //Cannon Team
    call f.registerObjectLimit('h04O', 12)          //Bomber
    call f.registerObjectLimit('h04W', 4)           //Siege Tank

    //Upgrades
    call f.registerObjectLimit('R001', UNLIMITED)   //Rising Tides
    call f.registerObjectLimit('R000', UNLIMITED)   //Tidesage Adept Training
    call f.registerObjectLimit('R01O', UNLIMITED)   //Crushing Wave
    call f.registerObjectLimit('R01T', UNLIMITED)   //Cluster Rockets
    call f.registerObjectLimit('R01U', UNLIMITED)   //Improved Barrage
    call f.registerObjectLimit('R00L', UNLIMITED)   //Quest Completed: City at Sea

    //Heroes
    call f.registerObjectLimit('H04A', 1)           //Jaina
    call f.registerObjectLimit('H05L', 1)           //Lady Ashvane

    //Free upgrades
    call f.SetObjectLevel('R00L', 1)                //Quest Completed: City at Sea
  endfunction
    
endlibrary