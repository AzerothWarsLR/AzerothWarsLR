library NagaSetup requires Faction, TeamSetup
  globals
    Faction FACTION_NAGA
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f

    set FACTION_NAGA = Faction.create("Illidari", PLAYER_COLOR_VIOLET, "|cffff00ff","ReplaceableTextures\\CommandButtons\\BTNEvilIllidan.blp", 0)
    set f = FACTION_NAGA
    set f.Team = TEAM_NAGA
    set f.UndefeatedResearch = 'R02L'
    set f.StartingGold = 250
    set f.StartingLumber = 2000

    call f.registerObjectLimit('nntt', UNLIMITED)   //Pillar of Waves
    call f.registerObjectLimit('n04T', UNLIMITED)   //Monument of Currents
    call f.registerObjectLimit('n055', UNLIMITED)   //Temple of Tides
    call f.registerObjectLimit('nnad', UNLIMITED)   //Altar of the Depths
    call f.registerObjectLimit('nnsg', UNLIMITED)   //Spawning Grounds
    call f.registerObjectLimit('h06S', UNLIMITED)   //Coral Forge
    call f.registerObjectLimit('n0A3', UNLIMITED)   //Royal Pyramid
    call f.registerObjectLimit('nnsa', UNLIMITED)   //Temple of Azshara
    call f.registerObjectLimit('nnfm', UNLIMITED)   //Coral Beds
    call f.registerObjectLimit('nntg', UNLIMITED)   //Tidal Guardian
    call f.registerObjectLimit('n005', UNLIMITED)   //Improved Tidal Guardian
    call f.registerObjectLimit('nmrb', UNLIMITED)   //Deep Sea Vault

    call f.registerObjectLimit('nmpe', UNLIMITED)   //Mur'gul Slave
    call f.registerObjectLimit('nmyr', UNLIMITED)   //Myrmidon
    call f.registerObjectLimit('nsnp', UNLIMITED)   //Snap Dragon
    call f.registerObjectLimit('nnsw', UNLIMITED)   //Siren
    call f.registerObjectLimit('nmsc', UNLIMITED)   //Shadowcaster
    call f.registerObjectLimit('nnsu', 6)           //Summoner
    call f.registerObjectLimit('nnrg', 6)           //Royal Guard
    call f.registerObjectLimit('nhyc', 8)           //Dragon Turtle
    call f.registerObjectLimit('nwgs', 8)   	    //Couatl
    call f.registerObjectLimit('e00Y', 4)  	    //Scylla

    call f.registerObjectLimit('R062', UNLIMITED)   //Redemption path
    call f.registerObjectLimit('R063', UNLIMITED)   //Exile Path
    call f.registerObjectLimit('R065', UNLIMITED)   //Madness Path

  endfunction

endlibrary