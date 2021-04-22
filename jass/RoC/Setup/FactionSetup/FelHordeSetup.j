library FelHordeSetup requires Faction, TeamSetup

  globals
    Faction FACTION_FEL_HORDE
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_FEL_HORDE = Faction.create("Fel Horde", PLAYER_COLOR_GREEN, "|c0020c000","ReplaceableTextures\\CommandButtons\\BTNPitLord.blp", 6)
    set f = FACTION_FEL_HORDE
    set f.VictoryMusic = "DarkVictory"
    set f.Team = TEAM_FEL_HORDE
    set f.PresenceResearch = 'R05L'

    call f.registerObjectLimit('o02Y', UNLIMITED)   //Great Hall
    call f.registerObjectLimit('o02Z', UNLIMITED)   //Stronghold
    call f.registerObjectLimit('o030', UNLIMITED)   //Fortress
    call f.registerObjectLimit('o02V', UNLIMITED)   //Altar of Storms
    call f.registerObjectLimit('o02W', UNLIMITED)   //Barracks
    call f.registerObjectLimit('o031', UNLIMITED)   //War Mill
    call f.registerObjectLimit('o033', UNLIMITED)   //Spirit Lodge
    call f.registerObjectLimit('o02X', UNLIMITED)   //Bestiary
    call f.registerObjectLimit('o032', UNLIMITED)   //Shipyard
    call f.registerObjectLimit('o034', UNLIMITED)   //Watch Tower
    call f.registerObjectLimit('o035', UNLIMITED)   //Improved Watch Tower
    call f.registerObjectLimit('u00Q', UNLIMITED)   //Hellforge
    call f.registerObjectLimit('n0AM', UNLIMITED)   //Boulder Tower
    call f.registerObjectLimit('n0AN', UNLIMITED)   //Advanced Boulder Tower
    call f.registerObjectLimit('ocbw', UNLIMITED)   //Burrow
    call f.registerObjectLimit('n0AP', UNLIMITED)   //Focal Demon Gate

    call f.registerObjectLimit('nbdk', 6)           //Black Drake
    call f.registerObjectLimit('odkt', 6)           //Eredar Warlock
    call f.registerObjectLimit('nchw', UNLIMITED)   //Fel Orc Warlock
    call f.registerObjectLimit('nchg', UNLIMITED)   //Fel Orc Grunt
    call f.registerObjectLimit('nchr', UNLIMITED)   //Fel Orc Raider
    call f.registerObjectLimit('ncpn', UNLIMITED)   //Fel Orc Peon
    call f.registerObjectLimit('owar', UNLIMITED)   //Horde Cavarly
    call f.registerObjectLimit('o01L', 6)           //Executioner
    call f.registerObjectLimit('o01O', 8)           //Demolisher
    call f.registerObjectLimit('u018', 10)          //Eye of Grillok
    call f.registerObjectLimit('u00V', UNLIMITED)   //Necrolyte
    call f.registerObjectLimit('n057', -UNLIMITED)  //Nether Dragon Hatchling
    call f.registerObjectLimit('n058', UNLIMITED)   //Troll Axethrowers
    call f.registerObjectLimit('obot', 24)  	    //Transport Ship
    call f.registerObjectLimit('odes', 24)  	    //Orc Frigate
    call f.registerObjectLimit('ojgn', 12)          //Juggernaught

    call f.registerObjectLimit('n05T', 1)           //Kazzak 
    call f.registerObjectLimit('n064', 1)           //Voone 
    call f.registerObjectLimit('n08A', 1)           //neltharaktu

    call f.registerObjectLimit('Robf', UNLIMITED)   //Demonic Flux
    call f.registerObjectLimit('R066', UNLIMITED)   //Burning Oil
    call f.registerObjectLimit('R00O', UNLIMITED)   //Ensnare
    call f.registerObjectLimit('Rorb', UNLIMITED)   //Reinforced Defenses
    call f.registerObjectLimit('Rosp', UNLIMITED)   //Spiked Barricades
    call f.registerObjectLimit('R023', UNLIMITED)   //Spiritual Infusion
    call f.registerObjectLimit('R000', -UNLIMITED)  //Skeletal Perserverance
    call f.registerObjectLimit('R024', UNLIMITED)   //Necrolyte adept Training
    call f.registerObjectLimit('R00M', UNLIMITED)   //Warlock Adept Training
    call f.registerObjectLimit('R03I', UNLIMITED)   //Eredar Warlock Adept Training
    call f.registerObjectLimit('R00Y', UNLIMITED)   //Improved Self-Bloodlust
    call f.registerObjectLimit('R03L', UNLIMITED)   //Improved Shadow Infusion
    call f.registerObjectLimit('R036', UNLIMITED)   //Incinerate
    call f.registerObjectLimit('R02L', UNLIMITED)   //Bloodcraze  
    call f.registerObjectLimit('R03O', UNLIMITED)   //Bloodcraze 
    call f.registerObjectLimit('R034', UNLIMITED)   //Enhanced Breath 
    call f.registerObjectLimit('R035', UNLIMITED)   //Improved Firebolt
    call f.registerObjectLimit('R01Z', UNLIMITED)   //Battle Stations
    call f.SetObjectLevel('R01Z', 1)                //Battle Stations


    call f.registerObjectLimit('n05R', 1)           //Felguard
    call f.registerObjectLimit('n06H', 1)           //Pit Fiend
    call f.registerObjectLimit('n07B', 1)           //Queen
    call f.registerObjectLimit('n07D', 1)           //Maiden
    call f.registerObjectLimit('n07o', 1)           //Terror
    call f.registerObjectLimit('n07N', 1)           //Lord


  endfunction
    
endlibrary