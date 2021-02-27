library CthunConfig initializer OnInit requires Faction, TeamConfig

  globals
    LiegeFaction FACTION_CTHUN
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_CTHUN = LiegeFaction.create("C'thun", PLAYER_COLOR_PINK, "|c00e55bb0","ReplaceableTextures\\CommandButtons\\BTNForgottenOne.blp", 2)
    set f = FACTION_CTHUN 
    set f.VictoryMusic = "HumanVictory"
    set f.PresenceResearch = 'R05N'
    set f.Team = TEAM_BLACKEMPIRE
  endfunction
    
endlibrary