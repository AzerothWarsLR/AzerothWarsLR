library RagnarosSetup requires Faction, TeamSetup

  globals
    LiegeFaction FACTION_RAGNAROS
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_RAGNAROS = LiegeFaction.create("Ragnaros", PLAYER_COLOR_ORANGE, "|c00ff8000","ReplaceableTextures\\CommandButtons\\BTNHeroAvatarOfFlame.blp")
    set f = FACTION_RAGNAROS
    set f.Team = TEAM_OLDGOD
    set f.StartingGold = 150
    set f.StartingLumber = 500

    //Structures
    call f.ModObjectLimit('h07E', UNLIMITED)   //Town Hall
    call f.ModObjectLimit('h07F', UNLIMITED)   //Keep
    call f.ModObjectLimit('h07G', UNLIMITED)   //Castle
    call f.ModObjectLimit('h02P', UNLIMITED)   //Farm  (Dwarven)
    call f.ModObjectLimit('h01S', UNLIMITED)   //Tavern
    call f.ModObjectLimit('h07B', UNLIMITED)   //Altar of Kings
    call f.ModObjectLimit('h07C', UNLIMITED)   //Barracks
    call f.ModObjectLimit('hlum', UNLIMITED)   //Lumber Mill
    call f.ModObjectLimit('h048', UNLIMITED)   //Blacksmith (Dwarven)
    call f.ModObjectLimit('h042', UNLIMITED)   //Machine Factory
    call f.ModObjectLimit('harm', UNLIMITED)   //Workshop
    call f.ModObjectLimit('hgra', UNLIMITED)   //Gryphon Aviary
    call f.ModObjectLimit('h07H', UNLIMITED)   //Scout Tower
    call f.ModObjectLimit('h07J', UNLIMITED)   //Cannon Tower
    call f.ModObjectLimit('h07K', UNLIMITED)   //Cannon Tower (Improved)
    call f.ModObjectLimit('h07D', UNLIMITED)   //Alliance Shipyard
    call f.ModObjectLimit('n07U', UNLIMITED)   //Marketplace
    call f.ModObjectLimit('h00B', 4)           //Dwarven Keep Tower
    call f.ModObjectLimit('h07I', UNLIMITED)   //Guard Tower
    call f.ModObjectLimit('h07L', UNLIMITED)   //Guard Tower (Improved)
    
    //Units
    call f.ModObjectLimit('h019', UNLIMITED)   //Dwarven Worker
    call f.ModObjectLimit('hbot', 12)   	    //Alliance Transport Ship
    call f.ModObjectLimit('hdes', 12) 	    //Alliance Frigate
    call f.ModObjectLimit('hbsh', 6)          //Alliance Battle Ship
    call f.ModObjectLimit('h00B', UNLIMITED)   //Rifleman
    call f.ModObjectLimit('h0A6', UNLIMITED)   //Warrior
    call f.ModObjectLimit('h0A7', UNLIMITED)   //Bear       
    call f.ModObjectLimit('h0A8', 6)           //Thane
    call f.ModObjectLimit('n0CH', UNLIMITED)   //Flame Keeper
    call f.ModObjectLimit('n0CC', 4)            //War Golem
    call f.ModObjectLimit('h0AA', 3)           //Magma Tank
    call f.ModObjectLimit('h0AB', UNLIMITED)   //Rune Priest
    call f.ModObjectLimit('n0CF', 2)           //Fire Wyrm
    call f.ModObjectLimit('n0CG', UNLIMITED)   //Core Hound

    call f.ModObjectLimit('U00W', 1)           //Executus
    call f.ModObjectLimit('H03G', 1)           //Dagran

    //Upgrades
    call f.ModObjectLimit('R03H', UNLIMITED)   //Engineering Adept Training
    call f.ModObjectLimit('R00K', UNLIMITED)   //Power Infusion
    call f.ModObjectLimit('R00F', UNLIMITED)   //Mithril Armor
    call f.ModObjectLimit('Rhfl', UNLIMITED)   //Flare
    call f.ModObjectLimit('Rhfs', UNLIMITED)   //Dragmentation Shards
    call f.ModObjectLimit('Rhlh', UNLIMITED)   //Improved Lumber Harvesting
    call f.ModObjectLimit('Rhac', UNLIMITED)   //Improved Masonry
    call f.ModObjectLimit('Rhri', UNLIMITED)   //Long Rifles
    call f.ModObjectLimit('Rhhb', UNLIMITED)   //Storm Hammers
    call f.ModObjectLimit('R063', UNLIMITED)   //Thunder Ale
    call f.ModObjectLimit('Rhme', UNLIMITED)   //Copper Forged Weaponry
    call f.ModObjectLimit('Rhar', UNLIMITED)   //Copper Armor Plating
    call f.ModObjectLimit('R014', UNLIMITED)   //Deeprun Tram
    call f.ModObjectLimit('R00V', UNLIMITED)   //Rune Priest Adept Training
    call f.ModObjectLimit('R00Z', UNLIMITED)   //Armor Penetration Rounds
    call f.ModObjectLimit('R010', UNLIMITED)   //Improved Spell Resistance
    call f.ModObjectLimit('R00T', UNLIMITED)   //Overclock 
    call f.ModObjectLimit('R00N', UNLIMITED)   //Improved Swig
    call f.ModObjectLimit('R08K', UNLIMITED)   //Titanforge Artifact

  endfunction
    
endlibrary