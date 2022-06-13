library IllidariConfig initializer OnInit requires Faction, TeamSetup

  globals
    LiegeFaction FACTION_ILLIDARI
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_ILLIDARI = LiegeFaction.create("Illidari", PLAYER_COLOR_GREEN, "|c0020c000","ReplaceableTextures\\CommandButtons\\BTNEvilIllidan.blp", 2)
    set f = FACTION_ILLIDARI 
    set f.VictoryMusic = "HumanVictory"
    set f.PresentResearch = 'R05N'
    set f.Team = TEAM_ILLIDARI
  endfunction
    
endlibrary