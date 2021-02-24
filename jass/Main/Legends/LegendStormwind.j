library LegendStormwind initializer OnInit requires Legend

  globals
    Legend LEGEND_VARIAN
    Legend LEGEND_KHADGAR
    Legend LEGEND_GALEN

    Legend LEGEND_STORMWINDKEEP
    Legend LEGEND_DARKSHIRE
    Legend LEGEND_HONORHOLD
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_VARIAN = Legend.create()
    set LEGEND_VARIAN.Unit = gg_unit_H00R_1875
    call LEGEND_VARIAN.AddUnitDependency(gg_unit_h00X_0007)
    set LEGEND_VARIAN.DeathMessage = "The King of Stormwind dies a warrior’s death, defending hearth and family. The Wrynn Dynasty crumbles with his passing."

    set LEGEND_GALEN = Legend.create()
    set LEGEND_GALEN.UnitType = 'H00Z'
    set LEGEND_GALEN.StartingXP = 5400

    set LEGEND_KHADGAR = Legend.create()
    set LEGEND_KHADGAR.UnitType = 'H05Y'

    set LEGEND_STORMWINDKEEP = Legend.create()
    set LEGEND_STORMWINDKEEP.Unit = gg_unit_h00X_0007
    set LEGEND_STORMWINDKEEP.DeathMessage = "Stormwind Keep, the capitol of the nation of Stormwind, has been destroyed!"

    set LEGEND_DARKSHIRE = Legend.create()
    set LEGEND_DARKSHIRE.Unit = gg_unit_h03Y_0077

    set LEGEND_HONORHOLD = Legend.create()
  endfunction

endlibrary