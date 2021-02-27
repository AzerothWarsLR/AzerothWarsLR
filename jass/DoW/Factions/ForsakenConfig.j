library ForsakenConfig initializer OnInit requires Faction, TeamConfig

  globals
    LiegeFaction FACTION_FORSAKEN
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_FORSAKEN = LiegeFaction.create("Nightmare", PLAYER_COLOR_PINK, "|c00e55bb0","ReplaceableTextures\\CommandButtons\\BTNForgottenOne.blp", 2)
    set f = FACTION_FORSAKEN 
    set f.VictoryMusic = "HumanVictory"
    set f.PresenceResearch = 'R05N'
    set f.Team = TEAM_FORSAKEN
  endfunction
    
endlibrary