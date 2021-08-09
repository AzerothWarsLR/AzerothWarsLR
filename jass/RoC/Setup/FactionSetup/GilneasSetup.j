library GilneasSetup requires Faction, TeamSetup

  globals
    Faction FACTION_GILNEAS
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_GILNEAS = Faction.create("Gilneas", PLAYER_COLOR_COAL, "|cff00781e", "ReplaceableTextures\\CommandButtons\\BTNGreymane.blp", 2)
    set f = FACTION_GILNEAS
    set f.Team = TEAM_NORTH_ALLIANCE

    //Structures
    call f.registerObjectLimit('h01R', UNLIMITED)   //Town Hall
    call f.registerObjectLimit('h023', UNLIMITED)   //Keep
    call f.registerObjectLimit('h02C', UNLIMITED)   //Castle
    call f.registerObjectLimit('h02F', UNLIMITED)   //Farm
    call f.registerObjectLimit('h02X', UNLIMITED)   //Altar
    call f.registerObjectLimit('h039', UNLIMITED)   //Scout Tower
    call f.registerObjectLimit('h03A', UNLIMITED)   //Guard Tower
    call f.registerObjectLimit('h03B', UNLIMITED)   //Cannon Tower
    call f.registerObjectLimit('h03D', UNLIMITED)   //Temple of the cursed
    call f.registerObjectLimit('h03E', UNLIMITED)   //Training Hall
    call f.registerObjectLimit('n008', UNLIMITED)   //Marketplace
    call f.registerObjectLimit('h03H', UNLIMITED)   //Shipyard
    call f.registerObjectLimit('h03O', UNLIMITED)   //Blacksmith
    call f.registerObjectLimit('h03Q', UNLIMITED)   //Garrison
    call f.registerObjectLimit('h052', UNLIMITED)   //Improved Guard Tower
    call f.registerObjectLimit('h04N', UNLIMITED)   //Improved Cannon Tower
    
    //Units
    call f.registerObjectLimit('hpea', UNLIMITED)   //Peasant
    call f.registerObjectLimit('hbot', UNLIMITED)   //Alliance Transport Ship
    call f.registerObjectLimit('hdes', UNLIMITED)   //Alliance Frigate
    call f.registerObjectLimit('hbsh', 12)          //Alliance Battle Ship
    call f.registerObjectLimit('n06K', UNLIMITED)   //Wildsoul
    call f.registerObjectLimit('h04M', UNLIMITED)   //Cleric
    call f.registerObjectLimit('h04E', UNLIMITED)   //Protector
    call f.registerObjectLimit('n06L', UNLIMITED)   //Armored Wolf
    call f.registerObjectLimit('o01V', 6)           //Greyguard
    call f.registerObjectLimit('n029', 12)          //Sea Giant
    call f.registerObjectLimit('h03L', UNLIMITED)   //Shotgunner
    call f.registerObjectLimit('o02F', 6)           //Mangonel
    call f.registerObjectLimit('n06Q', 12)          //Royal Guard

    //Upgrades


  endfunction
    
endlibrary