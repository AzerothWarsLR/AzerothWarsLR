library TeamSetup requires Team

  globals
    Team TEAM_LEGION
    Team TEAM_ALLIANCE
    Team TEAM_HORDE
    Team TEAM_NIGHT_ELVES
    Team TEAM_NAGA
    Team TEAM_GILNEAS
    Team TEAM_SCARLET
  endglobals

  public function OnInit takes nothing returns nothing 
    //Starting teams
    local Team t = 0
    set TEAM_LEGION = Team.create("Burning Legion")
    set TEAM_LEGION.VictoryMusic = "DarkVictory"

    set TEAM_ALLIANCE = Team.create("Alliance")
    set TEAM_ALLIANCE.VictoryMusic = "HeroicVictory"

    set TEAM_HORDE = Team.create("Horde")
    set TEAM_HORDE.VictoryMusic = "DarkVictory"

    set TEAM_NIGHT_ELVES = Team.create("Night Elves")
    set TEAM_NIGHT_ELVES.VictoryMusic = "HeroicVictory"

    set TEAM_NAGA = Team.create("Illidari")
    set TEAM_NAGA.VictoryMusic = "DarkVictory"

    set TEAM_GILNEAS = Team.create("Gilneas")
    set TEAM_GILNEAS.VictoryMusic = "HeroicVictory"

    set TEAM_SCARLET = Team.create("Scarlet Crusade")
    set TEAM_SCARLET.VictoryMusic = "DarkVictory"
  endfunction

endlibrary