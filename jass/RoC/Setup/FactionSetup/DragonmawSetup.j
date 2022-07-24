library DragonmawSetup requires Faction, TeamSetup

  globals
    LiegeFaction FACTION_DRAGONMAW
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_DRAGONMAW = LiegeFaction.create("Dragonmaw", PLAYER_COLOR_YELLOW, "|C00FFFC01","ReplaceableTextures\\CommandButtons\\BTNNecroMagus.blp")
    set f = FACTION_DRAGONMAW
    set f.Team = TEAM_HORDE
    set f.StartingGold = 150
    set f.StartingLumber = 350

    call f.ModObjectLimit('o039', UNLIMITED)   //Great Hall
    call f.ModObjectLimit('o03A', UNLIMITED)   //Stronghold
    call f.ModObjectLimit('o03B', UNLIMITED)   //Fortress
    call f.ModObjectLimit('o03C', UNLIMITED)   //Altar of Storms
    call f.ModObjectLimit('o03D', UNLIMITED)   //Barracks
    call f.ModObjectLimit('o03J', UNLIMITED)   //War Mill
    call f.ModObjectLimit('o03E', UNLIMITED)   //Spirit Lodge
    call f.ModObjectLimit('o05J', UNLIMITED)   //Bestiary
    call f.ModObjectLimit('o03I', UNLIMITED)   //Shipyard
    call f.ModObjectLimit('o03G', UNLIMITED)   //Watch Tower
    call f.ModObjectLimit('o03H', UNLIMITED)   //Improved Watch Tower
    call f.ModObjectLimit('u00Y', UNLIMITED)   //Shop
    call f.ModObjectLimit('o03K', UNLIMITED)   //Burrow

    call f.ModObjectLimit('n0CP', 2)           //Black Drake
    call f.ModObjectLimit('o05M', 8)           //WindRider
    call f.ModObjectLimit('n07X', UNLIMITED)   //Fel Orc Warlock
    call f.ModObjectLimit('o05K', UNLIMITED)   //Fel Orc Grunt
    call f.ModObjectLimit('o05P', UNLIMITED)   //Fel Orc Peon
    call f.ModObjectLimit('n0CQ', UNLIMITED)   //Fel Orc Peon
    call f.ModObjectLimit('o04I', 6)           //Executioner
    call f.ModObjectLimit('o04K', 6)           //Demolisher
    call f.ModObjectLimit('n09O', 6)           //DK
    call f.ModObjectLimit('u01T', UNLIMITED)   //Necrolyte
    call f.ModObjectLimit('o05L', UNLIMITED)   //Phase Grenadier
    call f.ModObjectLimit('obot', 12)  	    //Transport Ship
    call f.ModObjectLimit('odes', 12)  	    //Orc Frigate
    call f.ModObjectLimit('ojgn', 6)          //Juggernaught

    call f.ModObjectLimit('O01Q', 1)           //Nekrosh
    call f.ModObjectLimit('O00Y', 1)           //Zuluhead


    call f.ModObjectLimit('R023', UNLIMITED)   //Spiritual Infusion
    call f.ModObjectLimit('Rosp', UNLIMITED)   //Spiked Barricades
    call f.ModObjectLimit('R06X', UNLIMITED)   //Magic Training
    call f.ModObjectLimit('R06Z', UNLIMITED)   //Herald Training



  endfunction
    
endlibrary