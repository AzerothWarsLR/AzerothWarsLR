library TeamConfig initializer OnInit requires Team, ScourgeConfig, LegionConfig, FelHordeConfig, LordaeronConfig, IronforgeConfig, DalaranConfig, QuelthalasConfig, FrostwolfConfig, WarsongConfig, SentinelsConfig, StormwindConfig, DruidsConfig

  globals
    Team TEAM_SCOURGE = 0
    Team TEAM_NORTH_ALLIANCE = 1
    Team TEAM_HORDE = 2
    Team TEAM_NIGHT_ELVES = 3
    Team TEAM_SOUTH_ALLIANCE = 4
    Team TEAM_FEL_HORDE = 5
    Team TEAM_AHNQIRAJ = 7
    Team TEAM_ILLIDARI = 6
    Team TEAM_QUELTHALAS = 8
    Team TEAM_EBON_BLADE = 55
  endglobals

  private function OnInit takes nothing returns nothing 
    //Starting teams
    local Team t = 0
    
    set TEAM_SCOURGE = Team.create("Scourge","ReplaceableTextures\\CommandButtons\\BTNUndeadCaptureFlag.blp", 2)
      call TEAM_SCOURGE.addFaction(FACTION_SCOURGE)
      call TEAM_SCOURGE.addFaction(FACTION_LEGION)        
    set TEAM_NORTH_ALLIANCE = Team.create("North Alliance","ReplaceableTextures\\CommandButtons\\BTNHumanCaptureFlag.blp", 3)
      call TEAM_NORTH_ALLIANCE.addFaction(FACTION_LORDAERON)
      call TEAM_NORTH_ALLIANCE.addFaction(FACTION_QUELTHELAS)      
      call TEAM_NORTH_ALLIANCE.addFaction(FACTION_DALARAN)
    set TEAM_HORDE = Team.create("Horde","ReplaceableTextures\\CommandButtons\\BTNOrcCaptureFlag.blp", 2)
      call TEAM_HORDE.addFaction(FACTION_FROSTWOLF)
      call TEAM_HORDE.addFaction(FACTION_WARSONG)        
    set TEAM_NIGHT_ELVES = Team.create("Night Elves","ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp", 2)
      call TEAM_NIGHT_ELVES.addFaction(FACTION_SENTINELS)
      call TEAM_NIGHT_ELVES.addFaction(FACTION_DRUIDS)
    set TEAM_SOUTH_ALLIANCE = Team.create("South Alliance","ReplaceableTextures\\CommandButtons\\BTNHelmutPurple.blp", 2)
      call TEAM_SOUTH_ALLIANCE.addFaction(FACTION_IRONFORGE)
      call TEAM_SOUTH_ALLIANCE.addFaction(FACTION_STORMWIND)               
    set TEAM_FEL_HORDE = Team.create("Fel Horde","", 1)
        
    //Solo event teams  
    set TEAM_ILLIDARI = Team.create("Illidari","",1)
    set TEAM_AHNQIRAJ = Team.create("Old Gods","",1)
    set TEAM_QUELTHALAS = Team.create("Quel'thalas","",1)    
    set TEAM_EBON_BLADE = Team.create("Ebon Blade","",2)   
  
  endfunction

endlibrary