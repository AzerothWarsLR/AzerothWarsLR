library VassalBrann initializer OnInit requires Faction, IronforgeConfig

  globals
    VassalFaction VASSAL_BRANN
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_XAVIUS = VassalFaction.create("Brann", PLAYER_COLOR_EMERALD, "|CFF00781E","ReplaceableTextures\\CommandButtons\\BTNSatyr.blp", FACTION_IRONFORGE, 0)
  endfunction
    
endlibrary