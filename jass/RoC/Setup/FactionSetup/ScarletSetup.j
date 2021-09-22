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
    call f.registerObjectLimit('h07X', UNLIMITED)   //Town Hall
    call f.registerObjectLimit('h07Y', UNLIMITED)   //Keep
    call f.registerObjectLimit('h07Z', UNLIMITED)   //Castle
    call f.registerObjectLimit('h088', UNLIMITED)   //Farm
    call f.registerObjectLimit('h080', UNLIMITED)   //Altar of Kings
    call f.registerObjectLimit('h081', UNLIMITED)   //Barracks
    call f.registerObjectLimit('h06G', UNLIMITED)   //Blacksmith
    call f.registerObjectLimit('h083', UNLIMITED)   //Chapel
    call f.registerObjectLimit('h084', UNLIMITED)   //Scout Tower
    call f.registerObjectLimit('h085', UNLIMITED)   //Guard Tower
    call f.registerObjectLimit('h087', UNLIMITED)   //Guard Tower (Improved)
    call f.registerObjectLimit('hshy', UNLIMITED)   //Alliance Shipyard
    call f.registerObjectLimit('h086', UNLIMITED)   //Marketplace 
    call f.registerObjectLimit('h082', UNLIMITED)   //Aviary           

    //Units
    call f.registerObjectLimit('hpea', UNLIMITED)   //Peasant
    call f.registerObjectLimit('hbot', 24) 	    //Alliance Transport Ship
    call f.registerObjectLimit('hdes', 24) 	    //Alliance Frigate
    call f.registerObjectLimit('hbsh', 12)          //Alliance Battle Ship
    call f.registerObjectLimit('h08I', UNLIMITED)   //Crusader
    call f.registerObjectLimit('h08L', UNLIMITED)   //Cavalier
    call f.registerObjectLimit('nchp', UNLIMITED)   //Inquisitor
    call f.registerObjectLimit('h06B', 6)           //Templar
    call f.registerObjectLimit('h08J', UNLIMITED)   //Arbalest
    call f.registerObjectLimit('h08K', UNLIMITED)   //Chaplain
    call f.registerObjectLimit('n09N', 6)           //Bishop
    call f.registerObjectLimit('n07N', 8)           //Airship
    call f.registerObjectLimit('o04C', 6)           //Mortar

    //Heroes
    call f.registerObjectLimit('H08G', 1)           //Saiden
    call f.registerObjectLimit('H08H', 1)           //Isilien
    call f.registerObjectLimit('H00Y', 1)           //Brigitte
    call f.registerObjectLimit('Hlgr', 1)           //Garithos

    //Upgrades
    call f.registerObjectLimit('R05D', UNLIMITED)   //Chaplain Adept Training
    call f.registerObjectLimit('R00I', UNLIMITED)   //Light's Praise Initiate Training
    call f.registerObjectLimit('R00K', UNLIMITED)   //Power Infusion
    call f.registerObjectLimit('Rhse', UNLIMITED)   //Magic Sentry
    call f.registerObjectLimit('Rhac', UNLIMITED)   //Improved Masonry
    call f.registerObjectLimit('R06Q', UNLIMITED)   //Paladin Adept Training

  endfunction
    
endlibrary