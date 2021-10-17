library TwilightSetup requires Faction, TeamSetup

  globals
    Faction FACTION_TWILIGHT
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_TWILIGHT = Faction.create("Twilight", PLAYER_COLOR_LAVENDER, "|cff9178a8","ReplaceableTextures\\CommandButtons\\BTNChogall.blp", 0)
    set f = FACTION_TWILIGHT
    set f.Team = TEAM_OLDGOD
    set f.StartingGold = 0
    set f.StartingLumber = 0

    call f.registerObjectLimit('o039', UNLIMITED)   //Great Hall
    call f.registerObjectLimit('o03A', UNLIMITED)   //Stronghold
    call f.registerObjectLimit('o03B', UNLIMITED)   //Fortress
    call f.registerObjectLimit('o03C', UNLIMITED)   //Altar of Storms
    call f.registerObjectLimit('o03D', UNLIMITED)   //Barracks
    call f.registerObjectLimit('o03J', UNLIMITED)   //War Mill
    call f.registerObjectLimit('o03E', UNLIMITED)   //Spirit Lodge
    call f.registerObjectLimit('o03F', UNLIMITED)   //Bestiary
    call f.registerObjectLimit('o03I', UNLIMITED)   //Shipyard
    call f.registerObjectLimit('o03G', UNLIMITED)   //Watch Tower
    call f.registerObjectLimit('o03H', UNLIMITED)   //Improved Watch Tower
    call f.registerObjectLimit('u00Y', UNLIMITED)   //Shop
    call f.registerObjectLimit('o03K', UNLIMITED)   //Burrow

    call f.registerObjectLimit('n051', 4)           //Black Drake
    call f.registerObjectLimit('o04J', 8)           //WindRider
    call f.registerObjectLimit('n07X', UNLIMITED)   //Fel Orc Warlock
    call f.registerObjectLimit('o01H', UNLIMITED)   //Fel Orc Grunt
    call f.registerObjectLimit('o04B', UNLIMITED)   //Fel Orc Peon
    call f.registerObjectLimit('n083', UNLIMITED)   //Horde Cavarly
    call f.registerObjectLimit('o04I', 6)           //Executioner
    call f.registerObjectLimit('o04K', 6)           //Demolisher
    call f.registerObjectLimit('n09O', 6)           //DK
    call f.registerObjectLimit('u01T', UNLIMITED)   //Necrolyte
    call f.registerObjectLimit('n087', UNLIMITED)   //Phase Grenadier
    call f.registerObjectLimit('obot', 12)  	    //Transport Ship
    call f.registerObjectLimit('odes', 12)  	    //Orc Frigate
    call f.registerObjectLimit('ojgn', 6)          //Juggernaught

    call f.registerObjectLimit('O01P', 1)           //Chogall
    call f.registerObjectLimit('H08Q', 1)           //Azil
    call f.registerObjectLimit('U01S', 1)           //Feludius
    call f.registerObjectLimit('O04H', 1)           //ignacius


    call f.registerObjectLimit('R023', UNLIMITED)   //Spiritual Infusion
    call f.registerObjectLimit('Rosp', UNLIMITED)   //Spiked Barricades
    call f.registerObjectLimit('R06X', UNLIMITED)   //Magic Training
    call f.registerObjectLimit('R06Z', UNLIMITED)   //Herald Training



  endfunction
    
endlibrary