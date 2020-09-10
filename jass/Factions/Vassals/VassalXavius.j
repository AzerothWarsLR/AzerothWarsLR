library VassalXavius initializer OnInit requires Faction, LegionConfig, LegendXavius

  globals
    VassalFaction VASSAL_XAVIUS
  endglobals

  private function OnInit takes nothing returns nothing
    set VASSAL_XAVIUS = VassalFaction.create("Xavius", PLAYER_COLOR_EMERALD, "|CFF00781E","ReplaceableTextures\\CommandButtons\\BTNSatyr.blp", FACTION_LEGION, LEGEND_XAVIUS)
    set VASSAL_XAVIUS.AbsenceResearch = 'R03S'
    set VASSAL_XAVIUS.WorkerItemType = 'I008'
    set VASSAL_XAVIUS.TeleportItemType = 'stel'
  endfunction
    
endlibrary