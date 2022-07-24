library NzothSetup requires Faction, TeamSetup
  globals
    LiegeFaction FACTION_NZOTH
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f

    set FACTION_NZOTH = LiegeFaction.create("纳沙塔尔", PLAYER_COLOR_SNOW, "|cffffffff","ReplaceableTextures\\CommandButtons\\BTNNagaSummoner.blp")
    set f = FACTION_NZOTH
    set f.Team = TEAM_OLDGOD
    set f.StartingGold = 150
    set f.StartingLumber = 500

    call f.ModObjectLimit('n0C2', UNLIMITED)   //Pillar of Waves
    call f.ModObjectLimit('n0C8', UNLIMITED)   //Monument of Currents
    call f.ModObjectLimit('n0C9', UNLIMITED)   //Temple of Tides
    call f.ModObjectLimit('n0C0', UNLIMITED)   //Altar of the Depths
    call f.ModObjectLimit('n0C4', UNLIMITED)   //Spawning Grounds
    call f.ModObjectLimit('n0C7', UNLIMITED)   //Coral Forge
    call f.ModObjectLimit('n0C3', UNLIMITED)   //Royal Pyramid
    call f.ModObjectLimit('n08V', UNLIMITED)   //Temple of Azshara
    call f.ModObjectLimit('n0C1', UNLIMITED)   //Coral Beds
    call f.ModObjectLimit('h0A4', UNLIMITED)   //Forge
    call f.ModObjectLimit('n0C5', UNLIMITED)   //Tidal Guardian
    call f.ModObjectLimit('n0C6', UNLIMITED)   //Improved Tidal Guardian
    call f.ModObjectLimit('n0BZ', UNLIMITED)   //Deep Sea Vault

    call f.ModObjectLimit('nmpe', UNLIMITED)   //Mur'gul Slave
    call f.ModObjectLimit('n0CA', UNLIMITED)   //Myrmidon
    call f.ModObjectLimit('n0CE', UNLIMITED)   //Snap Dragon
    call f.ModObjectLimit('n0CB', UNLIMITED)   //Siren
    call f.ModObjectLimit('n0CD', UNLIMITED)   //Shadowcaster
    call f.ModObjectLimit('h02P', 6)           //Royal Guard
    call f.ModObjectLimit('n0CL', 8)           //Dragon Turtle
    call f.ModObjectLimit('nwgs', 8)   	    //Couatl
    call f.ModObjectLimit('u02J', 4)  	    //Scylla
    call f.ModObjectLimit('h01Q', 4)  	    //Immortal Guardian
    call f.ModObjectLimit('n0CO', 2)  	    //Immortal Guardian

    call f.ModObjectLimit('H08U', 1)  	    //Aszhara
    call f.ModObjectLimit('H0A5', 1)  	    //Najentus

    call f.ModObjectLimit('R08O', UNLIMITED)   //Bloodking Training
    call f.ModObjectLimit('R08P', UNLIMITED)   //Deepseer Training

  endfunction

endlibrary