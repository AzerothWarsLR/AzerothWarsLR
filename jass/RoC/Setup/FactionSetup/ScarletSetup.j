library ScarletSetup requires Faction, TeamSetup

  globals
    Faction FACTION_SCARLET
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    set FACTION_SCARLET = Faction.create("Scarlet Crusade", PLAYER_COLOR_MAROON, "|cff800000","ReplaceableTextures\\CommandButtons\\BTNHeroArchMage.blp", 0)
    set f = FACTION_SCARLET
    set f.Team = TEAM_ALLIANCE
    set f.StartingGold = 150
    set f.StartingLumber = 500

    //Structures
    call f.registerObjectLimit('htow', UNLIMITED)   //Town Hall
    call f.registerObjectLimit('hkee', UNLIMITED)   //Keep
    call f.registerObjectLimit('hcas', UNLIMITED)   //Castle
    call f.registerObjectLimit('hhou', UNLIMITED)   //Farm
    call f.registerObjectLimit('halt', UNLIMITED)   //Altar of Kings
    call f.registerObjectLimit('hbar', UNLIMITED)   //Barracks
    call f.registerObjectLimit('hbla', UNLIMITED)   //Blacksmith
    call f.registerObjectLimit('h035', UNLIMITED)   //Chapel
    call f.registerObjectLimit('hwtw', UNLIMITED)   //Scout Tower
    call f.registerObjectLimit('hgtw', UNLIMITED)   //Guard Tower
    call f.registerObjectLimit('h006', UNLIMITED)   //Guard Tower (Improved)
    call f.registerObjectLimit('hctw', UNLIMITED)   //Cannon Tower
    call f.registerObjectLimit('h007', UNLIMITED)   //Cannon Tower (Improved)
    call f.registerObjectLimit('hshy', UNLIMITED)   //Alliance Shipyard
    call f.registerObjectLimit('nmrk', UNLIMITED)   //Marketplace 
    call f.registerObjectLimit('h06C', UNLIMITED)   //Aviary           

    //Units
    call f.registerObjectLimit('hpea', UNLIMITED)   //Peasant
    call f.registerObjectLimit('hbot', 24) 	    //Alliance Transport Ship
    call f.registerObjectLimit('hdes', 24) 	    //Alliance Frigate
    call f.registerObjectLimit('hbsh', 12)          //Alliance Battle Ship
    call f.registerObjectLimit('hfoo', UNLIMITED)   //Footman
    call f.registerObjectLimit('hkni', UNLIMITED)   //Knight
    call f.registerObjectLimit('nchp', UNLIMITED)   //Cleric
    call f.registerObjectLimit('h00F', 6)           //Paladin 
    call f.registerObjectLimit('nwe2', 6)           //Thunder Eagle
    call f.registerObjectLimit('h01C', UNLIMITED)   //Longbowman
    call f.registerObjectLimit('n03K', UNLIMITED)   //Chaplain
    call f.registerObjectLimit('hcth', UNLIMITED)   //Silver Hand Squire
    call f.registerObjectLimit('h02Q', 6)           //Pegasus Knight

    //Demis
    call f.registerObjectLimit('h012', 1)           //Falric

    //Upgrades
    call f.registerObjectLimit('R02E', UNLIMITED)   //Chaplain Adept Training
    call f.registerObjectLimit('R00I', UNLIMITED)   //Light's Praise Initiate Training
    call f.registerObjectLimit('R00K', UNLIMITED)   //Power Infusion
    call f.registerObjectLimit('Rhse', UNLIMITED)   //Magic Sentry
    call f.registerObjectLimit('Rhan', UNLIMITED)   //Animal War Training
    call f.registerObjectLimit('Rhlh', UNLIMITED)   //Improved Lumber Harvesting
    call f.registerObjectLimit('Rhac', UNLIMITED)   //Improved Masonry
    call f.registerObjectLimit('R04D', UNLIMITED)   //Exorcism
    call f.registerObjectLimit('R01P', UNLIMITED)   //Ensnare
    call f.registerObjectLimit('R06Q', UNLIMITED)   //Paladin Adept Training
    call f.registerObjectLimit('R04A', UNLIMITED)   //Rapid Fire
    call f.registerObjectLimit('R00B', UNLIMITED)   //Veteran Footmen
    call f.registerObjectLimit('R01Q', UNLIMITED)   //Pegasus Taming
  endfunction
    
endlibrary