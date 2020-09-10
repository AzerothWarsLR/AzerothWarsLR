library VassalLorthemar initializer OnInit requires Faction, QuelthalasConfig

  globals
    VassalFaction VASSAL_LORTHEMAR
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_XAVIUS = VassalFaction.create("Lor'themar", PLAYER_COLOR_EMERALD, "|CFF00781E","ReplaceableTextures\\CommandButtons\\BTNSatyr.blp", FACTION_QUELTHALAS, 0)
  endfunction
    
endlibrary