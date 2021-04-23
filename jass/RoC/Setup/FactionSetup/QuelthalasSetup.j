library QuelthalasSetup requires Faction, TeamSetup

  globals
    Faction FACTION_QUELTHALAS
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    set FACTION_QUELTHALAS = Faction.create("Quel'thalas", PLAYER_COLOR_CYAN, "|C0000FFFF","ReplaceableTextures\\CommandButtons\\BTNSylvanusWindrunner.blp", 2)
    set f = FACTION_QUELTHALAS
    set f.VictoryMusic = "HumanVictory"
    set f.Team = TEAM_NORTH_ALLIANCE
    set f.PresenceResearch = 'R05U'
    set f.StartingGold = 150
    set f.StartingLumber = 500
 
    //Structures
    call f.registerObjectLimit('h033', UNLIMITED)   //Steading
    call f.registerObjectLimit('h03S', UNLIMITED)   //Mansion
    call f.registerObjectLimit('h03T', UNLIMITED)   //Palace
    call f.registerObjectLimit('h01H', UNLIMITED)   //Altar of Prowess
    call f.registerObjectLimit('h02Y', UNLIMITED)   //Artisan's Hall
    call f.registerObjectLimit('h034', UNLIMITED)   //Arcane Sanctum (Quel'thalas)
    call f.registerObjectLimit('h073', UNLIMITED)   //Scout Tower
    call f.registerObjectLimit('h074', UNLIMITED)   //Arcane Tower
    call f.registerObjectLimit('h075', UNLIMITED)   //Arcane Tower (Improved)
    call f.registerObjectLimit('negt', UNLIMITED)   //High Elven Guard Tower
    call f.registerObjectLimit('n003', UNLIMITED)   //High Elven Guard Tower (Improved)
    call f.registerObjectLimit('h04V', UNLIMITED)   //Arcane Vault (Elven)
    call f.registerObjectLimit('nheb', UNLIMITED)   //Cantonment
    call f.registerObjectLimit('n0A2', UNLIMITED)   //Consortium
    call f.registerObjectLimit('h03J', UNLIMITED)   //Academy
    call f.registerObjectLimit('h077', UNLIMITED)   //Alliance Shipyard
    call f.registerObjectLimit('nefm', UNLIMITED)   //Residence
    call f.registerObjectLimit('n06Y', 2)           //Healing Spire

    //Units
    call f.registerObjectLimit('nbee', UNLIMITED)   //Elven Worker
    call f.registerObjectLimit('hbot', 24)   	    //Alliance Transport Ship
    call f.registerObjectLimit('hdes', 24)  	    //Alliance Frigate
    call f.registerObjectLimit('hbsh', 12)          //Alliance Battle Ship 
    call f.registerObjectLimit('hhes', UNLIMITED)   //Elven Warrior
    call f.registerObjectLimit('hmpr', UNLIMITED)   //Priest
    call f.registerObjectLimit('hsor', UNLIMITED)   //Sorceress
    call f.registerObjectLimit('hdhw', 6)           //Dragonhawk Rider
    call f.registerObjectLimit('nhea', UNLIMITED)   //Archer
    call f.registerObjectLimit('e008', 6)           //Elven Ballista
    call f.registerObjectLimit('n00A', 6)           //Farstrider
    call f.registerObjectLimit('n063', 12)          //Magus 
    call f.registerObjectLimit('hspt', UNLIMITED)   //Spell Breaker    
    call f.registerObjectLimit('u00J', 2)           //Arcane Wagon

    //Demi-heroes
    call f.registerObjectLimit('n075', 1)           //Vareesa 

    //Upgrades
    call f.registerObjectLimit('R01S', UNLIMITED)   //Aimed Shot
    call f.registerObjectLimit('R00G', UNLIMITED)   //Feint
    call f.registerObjectLimit('R01R', UNLIMITED)   //Improved Bows
    call f.registerObjectLimit('R029', UNLIMITED)   //Magus Adept Training
    call f.registerObjectLimit('R00K', UNLIMITED)   //Power Infusion
    call f.registerObjectLimit('Rhcd', UNLIMITED)   //Cloud
    call f.registerObjectLimit('Rhss', UNLIMITED)   //Control Magic
    call f.registerObjectLimit('Rhlh', UNLIMITED)   //Improved Lumber Harvesting
    call f.registerObjectLimit('Rhac', UNLIMITED)   //Improved Masonry
    call f.registerObjectLimit('Rhse', UNLIMITED)   //Magic Sentry
    call f.registerObjectLimit('Rhpt', UNLIMITED)   //Priest Adept Training
    call f.registerObjectLimit('Rhst', UNLIMITED)   //Sorceress Adept Training
    
    //Masteries
    call f.registerObjectLimit('R01A', UNLIMITED)   //Arcane Empowerment
    call f.registerObjectLimit('R00T', UNLIMITED)   //Archery Mastery
    call f.registerObjectLimit('R00H', UNLIMITED)   //Blood Elf Mastery
    
    //Paths
    call f.registerObjectLimit('R046', UNLIMITED)   //Quel'thelas Full Mobilization
    call f.registerObjectLimit('R04U', UNLIMITED)   //Solo Path
  endfunction
    
endlibrary