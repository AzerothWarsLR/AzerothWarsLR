library ForsakenConfig initializer OnInit requires Faction, TeamSetup

  globals
    LiegeFaction FACTION_FORSAKEN
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_FORSAKEN = LiegeFaction.create("Forsaken", PLAYER_COLOR_PEACH, "|c00F8A48B","ReplaceableTextures\\CommandButtons\\BTNBansheeRanger.blp", 2)
    set f = FACTION_FORSAKEN 
    set f.VictoryMusic = "HumanVictory"
    set f.PresenceResearch = 'R05N'
    set f.Team = TEAM_FORSAKEN
  endfunction
    
endlibrary