library CthunConfig initializer OnInit requires Faction, TeamSetup

  globals
    LiegeFaction FACTION_CTHUN
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_CTHUN = LiegeFaction.create("C'thun", PLAYER_COLOR_WHEAT, "|c00EBCD87","ReplaceableTextures\\CommandButtons\\BTNForgottenOne.blp", 2)
    set f = FACTION_CTHUN 
    set f.VictoryMusic = "HumanVictory"
    set f.PresentResearch = 'R05N'
    set f.Team = TEAM_BLACKEMPIRE
  endfunction
    
endlibrary