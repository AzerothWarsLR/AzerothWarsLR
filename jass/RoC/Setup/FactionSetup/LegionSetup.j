library LegionSetup requires Faction, TeamSetup

  globals
    Faction FACTION_LEGION
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_LEGION = Faction.create("Legion", PLAYER_COLOR_PEANUT, "|CFFBF8F4F","ReplaceableTextures\\CommandButtons\\BTNKiljaedin.blp", 0)
    set f = FACTION_LEGION
    set f.UndefeatedResearch = 'R04T'
    set f.Team = TEAM_LEGION
    set f.StartingGold = 150
    set f.StartingLumber = 500
    //Structures
    call f.registerObjectLimit('u00H', UNLIMITED)   //Legion Defensive Pylon
    call f.registerObjectLimit('u00I', UNLIMITED)   //Improved Defensive Pylon
    call f.registerObjectLimit('u00F', UNLIMITED)   //Dormant Spire
    call f.registerObjectLimit('u00C', UNLIMITED)   //Legion Bastion
    call f.registerObjectLimit('u00N', UNLIMITED)   //Burning Citadel
    call f.registerObjectLimit('u00U', UNLIMITED)   //Hell Palace
    call f.registerObjectLimit('n040', UNLIMITED)   //Armory
    call f.registerObjectLimit('u009', UNLIMITED)   //Undead Shipyard
    call f.registerObjectLimit('u00E', UNLIMITED)   //Generator
    call f.registerObjectLimit('u01N', UNLIMITED)   //Burning Altar
    call f.registerObjectLimit('u015', UNLIMITED)   //Unholy Reliquary
    call f.registerObjectLimit('u006', UNLIMITED)   //Void Summoning Spire
    call f.registerObjectLimit('ndmg', UNLIMITED)   //Demon Gate
    call f.registerObjectLimit('n04N', UNLIMITED)   //Infernal Machine Factory
    call f.registerObjectLimit('n04Q', UNLIMITED)   //Nether Pit
  
    //Units
    call f.registerObjectLimit('u00D', UNLIMITED)   //Legion Herald
    call f.registerObjectLimit('u007', 6)           //Dreadlord
    call f.registerObjectLimit('n04P', UNLIMITED)   //Warlock
    call f.registerObjectLimit('ninc', UNLIMITED)   //Burning archer
    call f.registerObjectLimit('n04K', UNLIMITED)   //Succubus
    call f.registerObjectLimit('n04J', UNLIMITED)   //Felstalker
    call f.registerObjectLimit('ubot', 24) 	        //Undead Transport SHip
    call f.registerObjectLimit('udes', 24) 	        //Undead Frigate
    call f.registerObjectLimit('uubs', 12)          //Undead Battleship         
    call f.registerObjectLimit('n04O', 6)           //Doomguard
    call f.registerObjectLimit('n04L', 6)           //Infernal Juggernaut
    call f.registerObjectLimit('ninf', 12)          //Infernal
    call f.registerObjectLimit('n04H', UNLIMITED)   //Fel Guard
    call f.registerObjectLimit('n04U', 4)           //Dragon
    call f.registerObjectLimit('n03L', 4)           //Barge

    call f.registerObjectLimit('n05R', 1)           //Felguard
    call f.registerObjectLimit('n06H', 1)           //Pit Fiend
    call f.registerObjectLimit('n07B', 1)           //Queen
    call f.registerObjectLimit('n07D', 1)           //Maiden
    call f.registerObjectLimit('n07o', 1)           //Terror
    call f.registerObjectLimit('n07N', 1)           //Lord

    //Researches
    call f.registerObjectLimit('R02C', UNLIMITED)   //Acute Sensors
    call f.registerObjectLimit('R02A', UNLIMITED)   //Chaos Infusion
    call f.registerObjectLimit('R028', UNLIMITED)   //Shadow Priest Adept Training
    call f.registerObjectLimit('R027', UNLIMITED)   //Warlock Adept Training
    call f.registerObjectLimit('R01Y', UNLIMITED)   //Astral Walk
    call f.registerObjectLimit('R04G', UNLIMITED)   //Improved Carrion Swarm
    call f.registerObjectLimit('R03Z', UNLIMITED)   //War Plating
    call f.registerObjectLimit('R040', UNLIMITED)   //Flying horrors
    
    //Heroes
    call f.registerObjectLimit('U00L', 1)           //Anetheron
    call f.registerObjectLimit('Umal', 1)           //Mal'ganis
    call f.registerObjectLimit('Utic', 1)           //Tichondrius

  endfunction
    
endlibrary