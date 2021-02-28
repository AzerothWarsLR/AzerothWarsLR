library BloodElvesConfig initializer OnInit requires Faction, TeamConfig

  globals
    LiegeFaction FACTION_BLOODELVES
  endglobals

  private function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_BLOODELVES = LiegeFaction.create("Blood Elves", PLAYER_COLOR_CYAN, "|C0000FFFF","ReplaceableTextures\\CommandButtons\\BTNHeroBloodElfPrince.blp", 2)
    set f = FACTION_BLOODELVES 
    set f.VictoryMusic = "HumanVictory"
    set f.PresenceResearch = 'R05N'
    set f.Team = TEAM_ILLIDARI
  endfunction
    
endlibrary