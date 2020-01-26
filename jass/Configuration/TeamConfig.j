library TeamConfig initializer OnInit requires Team, ScourgeConfig, LegionConfig, FelHordeConfig, LordaeronConfig, IronforgeConfig, DalaranConfig, QuelthalasConfig, FrostwolfConfig, WarsongConfig, SentinelsConfig, StormwindConfig, DruidsConfig

  globals
    Team TEAM_SCOURGE
    Team TEAM_NORTH_ALLIANCE
    Team TEAM_HORDE
    Team TEAM_NIGHT_ELVES
    Team TEAM_SOUTH_ALLIANCE
    Team TEAM_FEL_HORDE
    Team TEAM_AHNQIRAJ
    Team TEAM_ILLIDARI
    Team TEAM_QUELTHALAS
    Team TEAM_EBON_BLADE
  endglobals

  private function OnInit takes nothing returns nothing 
    //Starting teams
    local Team t = 0
    
    set TEAM_SCOURGE = Team.create("Scourge","ReplaceableTextures\\CommandButtons\\BTNUndeadCaptureFlag.blp")
      call TEAM_SCOURGE.addFaction(FACTION_SCOURGE)
      call TEAM_SCOURGE.addFaction(FACTION_LEGION)        
    set TEAM_NORTH_ALLIANCE = Team.create("North Alliance","ReplaceableTextures\\CommandButtons\\BTNHumanCaptureFlag.blp")
      call TEAM_NORTH_ALLIANCE.addFaction(FACTION_LORDAERON)
      call TEAM_NORTH_ALLIANCE.addFaction(FACTION_QUELTHALAS)      
      call TEAM_NORTH_ALLIANCE.addFaction(FACTION_DALARAN)
    set TEAM_HORDE = Team.create("Horde","ReplaceableTextures\\CommandButtons\\BTNOrcCaptureFlag.blp")
      call TEAM_HORDE.addFaction(FACTION_FROSTWOLF)
      call TEAM_HORDE.addFaction(FACTION_WARSONG)        
    set TEAM_NIGHT_ELVES = Team.create("Night Elves","ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")
      call TEAM_NIGHT_ELVES.addFaction(FACTION_SENTINELS)
      call TEAM_NIGHT_ELVES.addFaction(FACTION_DRUIDS)
    set TEAM_SOUTH_ALLIANCE = Team.create("South Alliance","ReplaceableTextures\\CommandButtons\\BTNHelmutPurple.blp")
      call TEAM_SOUTH_ALLIANCE.addFaction(FACTION_IRONFORGE)
      call TEAM_SOUTH_ALLIANCE.addFaction(FACTION_STORMWIND)               
    set TEAM_FEL_HORDE = Team.create("Fel Horde","")
        
    //Solo event teams  
    set TEAM_ILLIDARI = Team.create("Illidari","")
    set TEAM_AHNQIRAJ = Team.create("Old Gods","")
    set TEAM_QUELTHALAS = Team.create("Quel'thalas","")    
    set TEAM_EBON_BLADE = Team.create("Ebon Blade","")   
  
  endfunction

endlibrary