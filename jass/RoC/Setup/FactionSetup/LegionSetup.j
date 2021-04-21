library LegionSetup requires Faction, TeamSetup

  globals
    Faction FACTION_LEGION
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_LEGION = Faction.create("Legion", PLAYER_COLOR_PEANUT, "|CFFBF8F4F","ReplaceableTextures\\CommandButtons\\BTNKiljaedin.blp", 3)
    set f = FACTION_LEGION
    set f.VictoryMusic = "UndeadVictory"
    set f.PresenceResearch = 'R04T'
    set f.Team = TEAM_SCOURGE
    //Structures
    call f.registerObjectLimit('u00H', UNLIMITED)   //Legion Defensive Pylon
    call f.registerObjectLimit('u00I', UNLIMITED)   //Improved Defensive Pylon
    call f.registerObjectLimit('u00F', UNLIMITED)   //Burning Shrine
    call f.registerObjectLimit('n040', UNLIMITED)   //Armory
    call f.registerObjectLimit('u009', UNLIMITED)   //Undead Shipyard
    call f.registerObjectLimit('u00E', UNLIMITED)   //Generator
    call f.registerObjectLimit('u01N', UNLIMITED)   //Burning Altar
    call f.registerObjectLimit('u015', UNLIMITED)   //Unholy Reliquary
    call f.registerObjectLimit('u006', UNLIMITED)   //Void Summoning Spire
    call f.registerObjectLimit('ndmg', UNLIMITED)   //Demon Gate
    //Units
    call f.registerObjectLimit('u00D', UNLIMITED)   //Legion Herald
    call f.registerObjectLimit('u007', 6)           //Dreadlord
    call f.registerObjectLimit('n04P', UNLIMITED)   //Warlock
    call f.registerObjectLimit('ninc', 12)          //Infernal Contraption
    call f.registerObjectLimit('n04K', UNLIMITED)   //Succubus
    call f.registerObjectLimit('n04J', UNLIMITED)   //Felstalker
    call f.registerObjectLimit('o01G', 12)          //Orc Cavalry
    call f.registerObjectLimit('o01F', 12)          //Beserker
    call f.registerObjectLimit('ubot', 24) 	    //Undead Transport SHip
    call f.registerObjectLimit('udes', 24) 	    //Undead Frigate
    call f.registerObjectLimit('uubs', 12)          //Undead Battleship       
    call f.registerObjectLimit('o00B', 1)           //Jubei'thos    
    call f.registerObjectLimit('n070', 6)           //Drake
    call f.registerObjectLimit('n04O', 6)           //Doomguard
    call f.registerObjectLimit('n04L', 6)           //Infernal Juggernaut
    call f.registerObjectLimit('ninf', 12)          //Infernal
    call f.registerObjectLimit('n04H', UNLIMITED)   //Fel Guard
    call f.registerObjectLimit('n04U', 4)           //Dragon
    //Researches
    call f.registerObjectLimit('R02C', UNLIMITED)   //Acute Sensors
    call f.registerObjectLimit('R02A', UNLIMITED)   //Chaos Infusion
    call f.registerObjectLimit('R028', UNLIMITED)   //Shadow Priest Adept Training
    call f.registerObjectLimit('R027', UNLIMITED)   //Warlock Adept Training
    call f.registerObjectLimit('R01Y', UNLIMITED)   //Astral Walk
    call f.registerObjectLimit('R04G', UNLIMITED)   //Improved Carrion Swarm
    //Quests
    call f.registerObjectLimit('R04B', UNLIMITED)   //Summoned legion

  endfunction
    
endlibrary