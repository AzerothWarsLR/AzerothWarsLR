library VassalChogall initializer OnInit requires Faction, FelHordeConfig

  globals
    VassalFaction VASSAL_CHOGALL
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_XAVIUS = VassalFaction.create("Cho'gall", PLAYER_COLOR_EMERALD, "|CFF00781E","ReplaceableTextures\\CommandButtons\\BTNSatyr.blp", FACTION_FEL_HORDE, 0)
  endfunction
    
endlibrary