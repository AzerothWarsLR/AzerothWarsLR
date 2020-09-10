library VassalRhonin initializer OnInit requires Faction, DalaranConfig

  globals
    VassalFaction VASSAL_RHONIN
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_XAVIUS = VassalFaction.create("Rhonin", PLAYER_COLOR_EMERALD, "|CFF00781E","ReplaceableTextures\\CommandButtons\\BTNSatyr.blp", FACTION_DALARAN, 0)
  endfunction
    
endlibrary