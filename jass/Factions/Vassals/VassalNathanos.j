library VassalNathanos initializer OnInit requires Faction, LordaeronConfig

  globals
    VassalFaction VASSAL_NATHANOS
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_XAVIUS = VassalFaction.create("Nathanos", PLAYER_COLOR_EMERALD, "|CFF00781E","ReplaceableTextures\\CommandButtons\\BTNSatyr.blp", FACTION_LORDAERON, 0)
  endfunction
    
endlibrary