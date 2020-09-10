library VassalTortola initializer OnInit requires Faction, DruidsConfig

  globals
    VassalFaction VASSAL_TORTOLA
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_XAVIUS = VassalFaction.create("Tortola", PLAYER_COLOR_EMERALD, "|CFF00781E","ReplaceableTextures\\CommandButtons\\BTNSatyr.blp", FACTION_DRUIDS, 0)
  endfunction
    
endlibrary