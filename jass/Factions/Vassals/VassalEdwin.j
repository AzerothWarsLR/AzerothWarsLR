library VassalEdwin initializer OnInit requires Faction, StormwindConfig

  globals
    VassalFaction VASSAL_EDWIN
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_XAVIUS = VassalFaction.create("Edwin", PLAYER_COLOR_EMERALD, "|CFF00781E","ReplaceableTextures\\CommandButtons\\BTNSatyr.blp", FACTION_STORMWIND, 0)
  endfunction
    
endlibrary