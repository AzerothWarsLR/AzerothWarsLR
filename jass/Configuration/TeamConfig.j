library TeamConfig initializer OnInit requires Team, ScourgeConfig, LegionConfig, FelHordeConfig, LordaeronConfig, IronforgeConfig, DalaranConfig, QuelthalasConfig, FrostwolfConfig, WarsongConfig, SentinelsConfig, StormwindConfig, DruidsConfig

  globals
    Team TEAM_SCOURGE
    Team TEAM_NORTH_ALLIANCE
    Team TEAM_HORDE
    Team TEAM_NIGHT_ELVES
    Team TEAM_SOUTH_ALLIANCE
    Team TEAM_FEL_HORDE
  endglobals

  private function OnInit takes nothing returns nothing 
    //Starting teams
    local Team t = 0
    
    set TEAM_SCOURGE = Team.create("Scourge","ReplaceableTextures\\CommandButtons\\BTNUndeadCaptureFlag.blp")
    set TEAM_NORTH_ALLIANCE = Team.create("North Alliance","ReplaceableTextures\\CommandButtons\\BTNHumanCaptureFlag.blp")
    set TEAM_HORDE = Team.create("Horde","ReplaceableTextures\\CommandButtons\\BTNOrcCaptureFlag.blp")
    set TEAM_NIGHT_ELVES = Team.create("Night Elves","ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")
    set TEAM_SOUTH_ALLIANCE = Team.create("South Alliance","ReplaceableTextures\\CommandButtons\\BTNHelmutPurple.blp")
    set TEAM_FEL_HORDE = Team.create("Fel Horde","")
  endfunction

endlibrary