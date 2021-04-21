library StormwindSetup requires Faction, TeamSetup, UnitTypesStormwind

  globals
    Faction FACTION_STORMWIND
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_STORMWIND = Faction.create("Stormwind", PLAYER_COLOR_AQUA, "|CFF106246","ReplaceableTextures\\CommandButtons\\BTNKnight.blp", 3)
    set f = FACTION_STORMWIND
    set f.VictoryMusic = "HeroicVictory"
    set f.Team = TEAM_SOUTH_ALLIANCE
    set f.PresenceResearch = 'R060'

    //Structures
    call f.registerObjectLimit('h06K', UNLIMITED)   //Town Hall
    call f.registerObjectLimit('h06M', UNLIMITED)   //Keep
    call f.registerObjectLimit('h06N', UNLIMITED)   //Castle
    call f.registerObjectLimit('h072', UNLIMITED)   //Farm
    call f.registerObjectLimit('h06T', UNLIMITED)   //Altar of Kings
    call f.registerObjectLimit('h06E', UNLIMITED)   //Barracks
    call f.registerObjectLimit('h06F', UNLIMITED)   //Blacksmith
    call f.registerObjectLimit('h06A', UNLIMITED)   //Workshop (Stormwind)
    call f.registerObjectLimit('hars', UNLIMITED)   //Arcane Sanctum
    call f.registerObjectLimit('h06V', UNLIMITED)   //Scout Tower
    call f.registerObjectLimit('h06W', UNLIMITED)   //Guard Tower
    call f.registerObjectLimit('h070', UNLIMITED)   //Guard Tower (Improved)
    call f.registerObjectLimit('h06X', UNLIMITED)   //Cannon Tower
    call f.registerObjectLimit('h071', UNLIMITED)   //Cannon Tower (Improved)
    call f.registerObjectLimit('n07T', UNLIMITED)   //Marketplace
    call f.registerObjectLimit('h06D', UNLIMITED)   //Alliance Shipyard
    call f.registerObjectLimit('h06Y', UNLIMITED)   //Arcane Tower
    call f.registerObjectLimit('h06Z', UNLIMITED)   //Arcane Tower (Improved)   
    call f.registerObjectLimit('h024', UNLIMITED)   //Light House         

    //Units
    call f.registerObjectLimit('hpea', UNLIMITED)   //Peasant
    call f.registerObjectLimit('h02O', UNLIMITED)   //Militia
    call f.registerObjectLimit('h009', UNLIMITED)   //Brigadier
    call f.registerObjectLimit('h03K', 12)          //Marshal
    call f.registerObjectLimit('h00A', UNLIMITED)   //Spearman
    call f.registerObjectLimit('h01B', UNLIMITED)   //Outriders
    call f.registerObjectLimit('h05F', 6)           //Stormwind Champion
    call f.registerObjectLimit('h00J', UNLIMITED)   //Clergyman
    call f.registerObjectLimit('n06N', 6)           //Gyrobomber
    call f.registerObjectLimit('n093', UNLIMITED)   //Chaplain
    call f.registerObjectLimit('hbot', 24)   	    //Alliance Transport Ship
    call f.registerObjectLimit('hdes', 24)   	    //Alliance Frigate
    call f.registerObjectLimit('hbsh', 12)          //Alliance Battle Ship
    call f.registerObjectLimit('h060', 3)           //Arathor Flagship

    call f.registerObjectLimit('h03W', 1)           //Danath

    //Researches
    call f.registerObjectLimit('R02E', UNLIMITED)   //Chaplain Adept Training
    call f.registerObjectLimit('R005', UNLIMITED)   //Clergyman Adept Training
    call f.registerObjectLimit('R00K', UNLIMITED)   //Power Infusion
    call f.registerObjectLimit('R02B', UNLIMITED)   //Steel Plating
    call f.registerObjectLimit('Rhan', UNLIMITED)   //Animal War Training
    call f.registerObjectLimit('Rhlh', UNLIMITED)   //Improved Lumber Harvesting
    call f.registerObjectLimit('Rhac', UNLIMITED)   //Improved Masonry
    call f.registerObjectLimit('Rhse', UNLIMITED)   //Magic Sentry
    call f.registerObjectLimit('R014', UNLIMITED)   //Deeprun Tram
    
    //Tier researches
    call f.registerObjectLimit('R02S', UNLIMITED)   //Cathedral of Light
    call f.registerObjectLimit('R02U', UNLIMITED)   //SI:7 Headquarters            
    call f.registerObjectLimit('R02K', UNLIMITED)   //Wizard's Sanctum
    call f.registerObjectLimit('R02V', UNLIMITED)   //Champion's Hall
    call f.registerObjectLimit('R038', UNLIMITED)   //Enforcer Training
    call f.registerObjectLimit('R03E', UNLIMITED)   //Saboteur Training
    call f.registerObjectLimit('R02Y', UNLIMITED)   //Battle Tactics
    call f.registerObjectLimit('R03D', UNLIMITED)   //Veteran Guard
    call f.registerObjectLimit('R02W', UNLIMITED)   //Sanctuary of Light
    call f.registerObjectLimit('R03A', UNLIMITED)   //Focus In The Light
    call f.registerObjectLimit('R03T', UNLIMITED)   //Electric Strike Ritual
    call f.registerObjectLimit('R03U', UNLIMITED)   //Solar Flare Ritual
  endfunction
    
endlibrary