library VassalSylvanas initializer OnInit requires Faction, ScourgeConfig

  globals
    VassalFaction VASSAL_SYLVANAS
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_XAVIUS = VassalFaction.create("Sylvanas", PLAYER_COLOR_EMERALD, "|CFF00781E","ReplaceableTextures\\CommandButtons\\BTNSatyr.blp", FACTION_SCOURGE, 0)
  endfunction
    
endlibrary