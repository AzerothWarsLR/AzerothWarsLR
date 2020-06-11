library LegendStormwind initializer OnInit requires Legend

  globals
    Legend LEGEND_VARIAN
    Legend LEGEND_MEDIVH
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_VARIAN = Legend.create()
    set LEGEND_VARIAN.Unit = gg_unit_H00R_1875
    call LEGEND_VARIAN.AddUnitDependency(gg_unit_h00X_0007)
    set LEGEND_VARIAN.DeathMessage = "The King of Stormwind dies a warrior’s death, defending hearth and family. The Wrynn Dynasty crumbles with his passing."
  
    set LEGEND_MEDIVH = Legend.create()
  endfunction

endlibrary