library DalaranConfig initializer OnInit requires Faction, TeamSetup

  globals
    LiegeFaction FACTION_DALARAN
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_DALARAN = LiegeFaction.create("Dalaran", PLAYER_COLOR_PINK, "|c00e55bb0","ReplaceableTextures\\CommandButtons\\BTNJaina.blp", 2)
    set f = FACTION_DALARAN 
    set f.VictoryMusic = "HumanVictory"
    set f.PresenceResearch = 'R05N'
    set f.Team = TEAM_NORTH_ALLIANCE
    
    //Structures
    call f.registerObjectLimit('h065', UNLIMITED)   //Refuge
    call f.registerObjectLimit('h066', UNLIMITED)   //Conclave
    call f.registerObjectLimit('h068', UNLIMITED)   //Observatory
    call f.registerObjectLimit('h063', UNLIMITED)   //Granary
    call f.registerObjectLimit('h044', UNLIMITED)   //Altar of Knowledge
    call f.registerObjectLimit('h069', UNLIMITED)   //Barracks
    call f.registerObjectLimit('h02N', UNLIMITED)   //Trade Quarters
    call f.registerObjectLimit('h036', UNLIMITED)   //Arcane Sanctuary
    call f.registerObjectLimit('h078', UNLIMITED)   //Scout Tower
    call f.registerObjectLimit('h079', UNLIMITED)   //Arcane Tower
    call f.registerObjectLimit('h07A', UNLIMITED)   //Arcane Tower (Improved)
    call f.registerObjectLimit('hvlt', UNLIMITED)   //Arcane Vault
    call f.registerObjectLimit('h076', UNLIMITED)   //Alliance Shipyard
    call f.registerObjectLimit('ndgt', UNLIMITED)   //Dalaran Tower
    call f.registerObjectLimit('n004', UNLIMITED)   //Dalaran Tower (Improved)
    call f.registerObjectLimit('h067', UNLIMITED)   //Laboratory
    call f.registerObjectLimit('n0AO', 2)           //Way Gate

    //Units
    call f.registerObjectLimit('h022', UNLIMITED)   //Shaper
    call f.registerObjectLimit('hbot', UNLIMITED)   //Alliance Transport Ship
    call f.registerObjectLimit('hdes', UNLIMITED)   //Alliance Frigate
    call f.registerObjectLimit('hbsh', 12)          //Alliance Battle Ship
    call f.registerObjectLimit('nhym', UNLIMITED)   //Hydromancer
    call f.registerObjectLimit('h032', UNLIMITED)   //Battlemage
    call f.registerObjectLimit('h02D', UNLIMITED)   //Geomancer
    call f.registerObjectLimit('h01I', UNLIMITED)   //Arcanist
    call f.registerObjectLimit('n007', 6)           //Kirin Tor
    call f.registerObjectLimit('n096', 6)           //Earth Golem
    call f.registerObjectLimit('n03E', UNLIMITED)   //Pyromancer
    call f.registerObjectLimit('n0AK', UNLIMITED)   //Sludge Flinger
    call f.registerObjectLimit('h02C', 1)           //Flagship 
    call f.registerObjectLimit('o02U', 6)           //Crystal Artillery


    //Demi-heroes
    call f.registerObjectLimit('njks', 1)           //Jailor Kassan

    //Upgrades
    call f.registerObjectLimit('R01I', UNLIMITED)   //Arcanist Adept Training
    call f.registerObjectLimit('R01V', UNLIMITED)   //Geomancer Adept Training
    call f.registerObjectLimit('R00E', UNLIMITED)   //Hydromancer Adept Training
    call f.registerObjectLimit('R01L', UNLIMITED)   //Magic Sentry
    call f.registerObjectLimit('R00K', UNLIMITED)   //Power Infusion
    call f.registerObjectLimit('R00D', UNLIMITED)   //Pyromancer Adept Training
    call f.registerObjectLimit('Rhlh', UNLIMITED)   //Improved Lumber Harvesting
    call f.registerObjectLimit('Rhac', UNLIMITED)   //Improved Masonry
    call f.registerObjectLimit('R06J', UNLIMITED)   //Improved Ooze
    call f.registerObjectLimit('R061', UNLIMITED)   //Improved Forked Lightning
    call f.registerObjectLimit('R06O', UNLIMITED)   //Improved Phase Blade
    call f.registerObjectLimit('R00J', UNLIMITED)   //Combat Tomes
  endfunction
    
endlibrary