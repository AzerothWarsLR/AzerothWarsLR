library ScarletCrusadeConfig initializer OnInit requires Faction, TeamSetup

  globals
    LiegeFaction FACTION_SCARLETCRUSADE
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_SCARLETCRUSADE = LiegeFaction.create("Scarlet Crusade", PLAYER_COLOR_MAROON, "|c009B0000","ReplaceableTextures\\CommandButtons\\BTNTheCaptain.blp", 2)
    set f = FACTION_SCARLETCRUSADE 
    set f.VictoryMusic = "HumanVictory"
    set f.PresenceResearch = 'R05N'
    set f.Team = TEAM_SCARLETCRUSADE
  endfunction
    
endlibrary