library KultirasConfig initializer OnInit requires Faction, TeamConfig

  globals
    LiegeFaction FACTION_KULTIRAS
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_KULTIRAS = LiegeFaction.create("Nightmare", PLAYER_COLOR_PINK, "|c00e55bb0","ReplaceableTextures\\CommandButtons\\BTNForgottenOne.blp", 2)
    set f = FACTION_KULTIRAS 
    set f.VictoryMusic = "HumanVictory"
    set f.PresenceResearch = 'R05N'
    set f.Team = TEAM_WESTALLIANCE
  endfunction
    
endlibrary