library EmeraldNightmareConfig initializer OnInit requires Faction, TeamSetup

  globals
    LiegeFaction FACTION_EMERALDNIGHTMARE
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_EMERALDNIGHTMARE = LiegeFaction.create("Nightmare", PLAYER_COLOR_EMERALD, "|c0000781E","ReplaceableTextures\\CommandButtons\\BTNSatyr.blp", 2)
    set f = FACTION_EMERALDNIGHTMARE 
    set f.VictoryMusic = "HumanVictory"
    set f.UndefeatedResearch = 'R05N'
    set f.Team = TEAM_BLACKEMPIRE
  endfunction
    
endlibrary