library LegendStormwind initializer OnInit requires Legend

  globals
    Legend LEGEND_VARIAN
    Legend LEGEND_MEDIVH

    Legend LEGEND_STORMWINDKEEP
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_VARIAN = Legend.create()
    set LEGEND_VARIAN.Unit = gg_unit_H00R_1875
    call LEGEND_VARIAN.AddUnitDependency(gg_unit_h00X_0007)
    set LEGEND_VARIAN.DeathMessage = "The King of Stormwind dies a warrior’s death, defending hearth and family. The Wrynn Dynasty crumbles with his passing."
  
    set LEGEND_MEDIVH = Legend.create()
    set LEGEND_MEDIVH.UnitType = 'H05Y'

    set LEGEND_STORMWINDKEEP = Legend.create()
    set LEGEND_STORMWINDKEEP.Unit = gg_unit_h00X_0007
    set LEGEND_STORMWINDKEEP.DeathMessage = "Stormwind Keep, the capitol of the nation of Stormwind, has been destroyed!"
  endfunction

endlibrary