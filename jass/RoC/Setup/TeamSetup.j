library TeamSetup requires Team

  globals
    Team TEAM_SCOURGE
    Team TEAM_NORTH_ALLIANCE
    Team TEAM_HORDE
    Team TEAM_NIGHT_ELVES
    Team TEAM_SOUTH_ALLIANCE
    Team TEAM_FEL_HORDE
    Team TEAM_NAGA
    Team TEAM_GILNEAS
    Team TEAM_KULTIRAS
  endglobals

  public function OnInit takes nothing returns nothing 
    //Starting teams
    local Team t = 0
    set TEAM_SCOURGE = Team.create("Scourge")
    set TEAM_SCOURGE.VictoryMusic = "DarkVictory"

    set TEAM_NORTH_ALLIANCE = Team.create("North Alliance")
    set TEAM_NORTH_ALLIANCE.VictoryMusic = "HeroicVictory"

    set TEAM_HORDE = Team.create("Horde")
    set TEAM_HORDE.VictoryMusic = "DarkVictory"

    set TEAM_NIGHT_ELVES = Team.create("Night Elves")
    set TEAM_NIGHT_ELVES.VictoryMusic = "HeroicVictory"

    set TEAM_SOUTH_ALLIANCE = Team.create("South Alliance")
    set TEAM_SOUTH_ALLIANCE.VictoryMusic = "HeroicVictory"

    set TEAM_FEL_HORDE = Team.create("Fel Horde")
    set TEAM_FEL_HORDE.VictoryMusic = "DarkVictory"

    set TEAM_NAGA = Team.create("Illidari")
    set TEAM_NAGA.VictoryMusic = "DarkVictory"

    set TEAM_GILNEAS = Team.create("Gilneas")
    set TEAM_GILNEAS.VictoryMusic = "HeroicVictory"

    set TEAM_KULTIRAS = Team.create("Kul'Tiras")
    set TEAM_KULTIRAS.VictoryMusic = "HeroicVictory"
  endfunction

endlibrary