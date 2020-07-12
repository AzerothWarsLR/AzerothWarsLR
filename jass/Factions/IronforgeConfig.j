
library IronforgeConfig initializer OnInit requires Faction

  globals
    Faction FACTION_IRONFORGE
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_IRONFORGE = Faction.create("Ironforge", PLAYER_COLOR_YELLOW, "|C00FFFC01","ReplaceableTextures\\CommandButtons\\BTNHeroMountainKing.blp", 3)
    set f = FACTION_IRONFORGE
    set f.AbsenceResearch = 'R01B'

    //Structures
    call f.registerObjectLimit('htow', UNLIMITED)   //Town Hall
    call f.registerObjectLimit('hkee', UNLIMITED)   //Keep
    call f.registerObjectLimit('hcas', UNLIMITED)   //Castle
    call f.registerObjectLimit('h02P', UNLIMITED)   //Farm  (Dwarven)
    call f.registerObjectLimit('h01S', UNLIMITED)   //Tavern
    call f.registerObjectLimit('halt', UNLIMITED)   //Altar of Kings
    call f.registerObjectLimit('hbar', UNLIMITED)   //Barracks
    call f.registerObjectLimit('hlum', UNLIMITED)   //Lumber Mill
    call f.registerObjectLimit('h048', UNLIMITED)   //Blacksmith (Dwarven)
    call f.registerObjectLimit('h042', UNLIMITED)   //Machine Factory
    call f.registerObjectLimit('harm', UNLIMITED)   //Workshop
    call f.registerObjectLimit('hgra', UNLIMITED)   //Gryphon Aviary
    call f.registerObjectLimit('hwtw', UNLIMITED)   //Scout Tower
    call f.registerObjectLimit('hctw', UNLIMITED)   //Cannon Tower
    call f.registerObjectLimit('h007', UNLIMITED)   //Cannon Tower (Improved)
    call f.registerObjectLimit('hshy', UNLIMITED)   //Alliance Shipyard
    call f.registerObjectLimit('nitb', 6)           //Excavation Site
    call f.registerObjectLimit('n07U', UNLIMITED)   //Marketplace
    call f.registerObjectLimit('h00B', 6)           //Dwarven Keep Tower
    call f.registerObjectLimit('hgtw', UNLIMITED)   //Guard Tower
    call f.registerObjectLimit('h006', UNLIMITED)   //Guard Tower (Improved)
    
    //Units
    call f.registerObjectLimit('h019', UNLIMITED)   //Dwarven Worker
    call f.registerObjectLimit('hbot', UNLIMITED)   //Alliance Transport Ship
    call f.registerObjectLimit('hdes', UNLIMITED)   //Alliance Frigate
    call f.registerObjectLimit('hbsh', 12)          //Alliance Battle Ship
    call f.registerObjectLimit('hrif', UNLIMITED)   //Rifleman
    call f.registerObjectLimit('hmtm', 9)           //Mortar Team
    call f.registerObjectLimit('hgyr', 12)          //Flying Machine
    call f.registerObjectLimit('hgry', 6)           //Gryphon Rider        
    call f.registerObjectLimit('hrdh', 4)           //Expedition Leader
    call f.registerObjectLimit('h018', UNLIMITED)   //Dwarven Warrior
    call f.registerObjectLimit('h01L', 6)           //Thane
    call f.registerObjectLimit('h037', UNLIMITED)   //Dwarven Engineer
    call f.registerObjectLimit('h02X', UNLIMITED)   //Explorer
    call f.registerObjectLimit('n02D', UNLIMITED)   //War Golem
    call f.registerObjectLimit('h03R', UNLIMITED)   //Tinker
    call f.registerObjectLimit('h041', 12)          //Fire Tank
    call f.registerObjectLimit('h01P', 3)           //Steam Tank
    call f.registerObjectLimit('n00C', 6)           //Rune Priest
    call f.registerObjectLimit('nsgg', 2)           //Siege Golem
    call f.registerObjectLimit('h02C', 0)           //Flagship 

    call f.registerObjectLimit('h01M', 1)           //Baelgun

    //Upgrades
    call f.registerObjectLimit('R03H', UNLIMITED)   //Engineering Adept Training
    call f.registerObjectLimit('R05P', UNLIMITED)   //Tinker Adept Training
    call f.registerObjectLimit('R00K', UNLIMITED)   //Power Infusion
    call f.registerObjectLimit('R00F', UNLIMITED)   //Mithril Armor
    call f.registerObjectLimit('Rhfl', UNLIMITED)   //Flare
    call f.registerObjectLimit('Rhfs', UNLIMITED)   //Dragmentation Shards
    call f.registerObjectLimit('Rhlh', UNLIMITED)   //Improved Lumber Harvesting
    call f.registerObjectLimit('Rhac', UNLIMITED)   //Improved Masonry
    call f.registerObjectLimit('Rhri', UNLIMITED)   //Long Rifles
    call f.registerObjectLimit('Rhhb', UNLIMITED)   //Storm Hammers
    call f.registerObjectLimit('R063', UNLIMITED)   //Thunder Ale

    //Excavation
    call f.registerObjectLimit('R035', UNLIMITED)   //Gunpowder Innovation
    call f.registerObjectLimit('R034', UNLIMITED)   //Steel Refinery
    call f.registerObjectLimit('R01Z', UNLIMITED)   //Ancient Medicine
    call f.registerObjectLimit('R01T', UNLIMITED)   //Wildhammer Alliance
    call f.registerObjectLimit('R04R', UNLIMITED)   //Dark Iron
    call f.registerObjectLimit('R048', UNLIMITED)   //Dwarven Dominion
    call f.registerObjectLimit('R01K', UNLIMITED)   //Dwarven Dominion
    call f.registerObjectLimit('R01M', UNLIMITED)   //siege tank research

    //Masteries
    call f.registerObjectLimit('R033', UNLIMITED)   //Elemental Mastery
    call f.registerObjectLimit('R013', UNLIMITED)   //Fortification Mastery
    call f.registerObjectLimit('R012', UNLIMITED)   //Siege Mastery
    
    //Paths
    call f.registerObjectLimit('R014', UNLIMITED)   //Dwarven Empire
  endfunction
    
endlibrary