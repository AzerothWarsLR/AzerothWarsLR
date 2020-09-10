library VassalSaurfang initializer OnInit requires Faction, WarsongConfig

  globals
    VassalFaction VASSAL_SAURFANG
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_XAVIUS = VassalFaction.create("Saurfang", PLAYER_COLOR_EMERALD, "|CFF00781E","ReplaceableTextures\\CommandButtons\\BTNSatyr.blp", FACTION_WARSONG, 0)
  endfunction
    
endlibrary