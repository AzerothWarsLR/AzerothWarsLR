library TeamConfig initializer OnInit requires Team

  globals
    Team TEAM_SCOURGE
    Team TEAM_BLACKEMPIRE
    Team TEAM_SCARLETCRUSADE
    Team TEAM_KULTIRAS
    Team TEAM_ILLIDARI
    Team TEAM_WESTALLIANCE
    Team TEAM_SOUTHALLIANCE
    Team TEAM_FORSAKEN
  endglobals

  private function OnInit takes nothing returns nothing 
    //Starting teams
    local Team t = 0
    
    set TEAM_SCOURGE = Team.create("Scourge")
    set TEAM_FORSAKEN = Team.create("Forsaken")
    set TEAM_SCARLETCRUSADE = Team.create("Scarlet Crusade")
    set TEAM_BLACKEMPIRE = Team.create("Black Empire")
    set TEAM_WESTALLIANCE = Team.create("West Alliance")
    set TEAM_ILLIDARI = Team.create("Illidari")
    set TEAM_SOUTHALLIANCE = Team.create("South Alliance")
    
  endfunction

endlibrary