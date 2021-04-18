library IronforgeSetup requires Faction, TeamSetup

  globals
    LiegeFaction FACTION_IRONFORGE
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_IRONFORGE = LiegeFaction.create("Ironforge", PLAYER_COLOR_YELLOW, "|C00FFFC01","ReplaceableTextures\\CommandButtons\\BTNHeroMountainKing.blp", 3)
    set f = FACTION_IRONFORGE
    set f.VictoryMusic = "HeroicVictory"
    set f.Team = TEAM_SOUTH_ALLIANCE
    set f.PresenceResearch = 'R05T'

    //Structures
    call f.registerObjectLimit('h07E', UNLIMITED)   //Town Hall
    call f.registerObjectLimit('h07F', UNLIMITED)   //Keep
    call f.registerObjectLimit('h07G', UNLIMITED)   //Castle
    call f.registerObjectLimit('h02P', UNLIMITED)   //Farm  (Dwarven)
    call f.registerObjectLimit('h01S', UNLIMITED)   //Tavern
    call f.registerObjectLimit('h07B', UNLIMITED)   //Altar of Kings
    call f.registerObjectLimit('h07C', UNLIMITED)   //Barracks
    call f.registerObjectLimit('hlum', UNLIMITED)   //Lumber Mill
    call f.registerObjectLimit('h048', UNLIMITED)   //Blacksmith (Dwarven)
    call f.registerObjectLimit('h042', UNLIMITED)   //Machine Factory
    call f.registerObjectLimit('harm', UNLIMITED)   //Workshop
    call f.registerObjectLimit('hgra', UNLIMITED)   //Gryphon Aviary
    call f.registerObjectLimit('h07H', UNLIMITED)   //Scout Tower
    call f.registerObjectLimit('h07J', UNLIMITED)   //Cannon Tower
    call f.registerObjectLimit('h07K', UNLIMITED)   //Cannon Tower (Improved)
    call f.registerObjectLimit('h07D', UNLIMITED)   //Alliance Shipyard
    call f.registerObjectLimit('n07U', UNLIMITED)   //Marketplace
    call f.registerObjectLimit('h00B', 6)           //Dwarven Keep Tower
    call f.registerObjectLimit('h07I', UNLIMITED)   //Guard Tower
    call f.registerObjectLimit('h07L', UNLIMITED)   //Guard Tower (Improved)
    
    //Units
    call f.registerObjectLimit('h019', UNLIMITED)   //Dwarven Worker
    call f.registerObjectLimit('hbot', UNLIMITED)   //Alliance Transport Ship
    call f.registerObjectLimit('hdes', UNLIMITED)   //Alliance Frigate
    call f.registerObjectLimit('hbsh', 12)          //Alliance Battle Ship
    call f.registerObjectLimit('hrif', UNLIMITED)   //Rifleman
    call f.registerObjectLimit('hmtm', 9)           //Mortar Team
    call f.registerObjectLimit('hgyr', 12)          //Flying Machine
    call f.registerObjectLimit('hgry', 6)           //Gryphon Rider        
    call f.registerObjectLimit('h018', UNLIMITED)   //Dwarven Warrior
    call f.registerObjectLimit('h01L', 6)           //Thane
    call f.registerObjectLimit('h037', UNLIMITED)   //Engineer
    call f.registerObjectLimit('n02D', UNLIMITED)   //War Golem
    call f.registerObjectLimit('h01P', 3)           //Steam Tank
    call f.registerObjectLimit('n00C', UNLIMITED)   //Rune Priest

    call f.registerObjectLimit('h01M', 1)           //Baelgun

    //Upgrades
    call f.registerObjectLimit('R03H', UNLIMITED)   //Engineering Adept Training
    call f.registerObjectLimit('R00K', UNLIMITED)   //Power Infusion
    call f.registerObjectLimit('R00F', UNLIMITED)   //Mithril Armor
    call f.registerObjectLimit('Rhfl', UNLIMITED)   //Flare
    call f.registerObjectLimit('Rhfs', UNLIMITED)   //Dragmentation Shards
    call f.registerObjectLimit('Rhlh', UNLIMITED)   //Improved Lumber Harvesting
    call f.registerObjectLimit('Rhac', UNLIMITED)   //Improved Masonry
    call f.registerObjectLimit('Rhri', UNLIMITED)   //Long Rifles
    call f.registerObjectLimit('Rhhb', UNLIMITED)   //Storm Hammers
    call f.registerObjectLimit('R063', UNLIMITED)   //Thunder Ale
    call f.registerObjectLimit('Rhme', UNLIMITED)   //Copper Forged Weaponry
    call f.registerObjectLimit('Rhar', UNLIMITED)   //Copper Armor Plating
    call f.registerObjectLimit('R014', UNLIMITED)   //Deeprun Tram
    call f.registerObjectLimit('R00V', UNLIMITED)   //Rune Priest Adept Training
    call f.registerObjectLimit('R00Z', UNLIMITED)   //Armor Penetration Rounds
    call f.registerObjectLimit('R010', UNLIMITED)   //Improved Spell Resistance
    call f.registerObjectLimit('R00T', UNLIMITED)   //Overclock 
    call f.registerObjectLimit('R00N', UNLIMITED)   //Improved Swig
  endfunction
    
endlibrary