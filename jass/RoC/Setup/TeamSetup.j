library TeamSetup requires Team

  globals
    Team TEAM_SCOURGE
    Team TEAM_NORTH_ALLIANCE
    Team TEAM_HORDE
    Team TEAM_NIGHT_ELVES
    Team TEAM_SOUTH_ALLIANCE
    Team TEAM_FEL_HORDE
  endglobals

  public function OnInit takes nothing returns nothing 
    //Starting teams
    local Team t = 0
    
    set TEAM_SCOURGE = Team.create("Scourge")
    set TEAM_SCOURGE.VictoryMusic = "UndeadVictory"
    set TEAM_SCOURGE.DefeatMusic = "UndeadDefeat"

    set TEAM_NORTH_ALLIANCE = Team.create("North Alliance")
    set TEAM_NORTH_ALLIANCE.VictoryMusic = "HumanVictory"
    set TEAM_NORTH_ALLIANCE.DefeatMusic = "HumanDefeat"
    
    set TEAM_HORDE = Team.create("Horde")
    set TEAM_NORTH_ALLIANCE.VictoryMusic = "OrcVictory"
    set TEAM_NORTH_ALLIANCE.DefeatMusic = "OrcDefeat"

    set TEAM_NIGHT_ELVES = Team.create("Night Elves")
    set TEAM_NIGHT_ELVES.VictoryMusic = "NightElfVictory"
    set TEAM_NIGHT_ELVES.DefeatMusic = "NightElfDefeat"

    set TEAM_SOUTH_ALLIANCE = Team.create("South Alliance")
    set TEAM_SOUTH_ALLIANCE.VictoryMusic = "HeroicVictory"
    set TEAM_SOUTH_ALLIANCE.DefeatMusic = "HumanDefeat"

    set TEAM_FEL_HORDE = Team.create("Fel Horde")
    set TEAM_FEL_HORDE.VictoryMusic = "DarkVictory"
    set TEAM_FEL_HORDE.DefeatMusic = "UndeadDefeat"
  endfunction

endlibrary