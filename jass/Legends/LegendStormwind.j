library LegendStormwind initializer OnInit requires Legend

  globals
    Legend LEGEND_STORMWIND
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_STORMWIND = Legend.create()
    set LEGEND_STORMWIND.Unit = gg_unit_H00R_1875
    call LEGEND_STORMWIND.AddUnitDependency(gg_unit_h00X_0007)
    set LEGEND_STORMWIND.DeathMessage = "The King of Stormwind dies a warrior’s death, defending hearth and family. The Wrynn Dynasty crumbles with his passing."
  endfunction

endlibrary