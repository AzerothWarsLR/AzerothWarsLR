library VassalJarod initializer OnInit requires Faction, SentinelsConfig

  globals
    VassalFaction VASSAL_JAROD
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_XAVIUS = VassalFaction.create("Jarod", PLAYER_COLOR_EMERALD, "|CFF00781E","ReplaceableTextures\\CommandButtons\\BTNSatyr.blp", FACTION_SENTINELS, 0)
  endfunction
    
endlibrary