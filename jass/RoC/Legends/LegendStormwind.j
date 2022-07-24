library LegendStormwind initializer OnInit requires Legend

  globals
    Legend LEGEND_VARIAN
    Legend LEGEND_KHADGAR
    Legend LEGEND_GALEN
    Legend LEGEND_BOLVAR

    Legend LEGEND_STORMWINDKEEP
    Legend LEGEND_DARKSHIRE
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_VARIAN = Legend.create()
    set LEGEND_VARIAN.UnitType = 'H00R'
    call LEGEND_VARIAN.AddUnitDependency(gg_unit_h00X_0007)
    set LEGEND_VARIAN.DeathMessage = "暴风王国国王像一个战士一样死在保卫家园和家人的过程中。乌瑞恩王朝随着他的去世而瓦解。"
    set LEGEND_VARIAN.Essential = true
    set LEGEND_VARIAN.StartingXP = 1800

    set LEGEND_GALEN = Legend.create()
    set LEGEND_GALEN.UnitType = 'H00Z'
    set LEGEND_GALEN.StartingXP = 1000

    set LEGEND_BOLVAR = Legend.create()
    set LEGEND_BOLVAR.UnitType = 'H017'

    set LEGEND_KHADGAR = Legend.create()
    set LEGEND_KHADGAR.UnitType = 'H05Y'
    set LEGEND_KHADGAR.StartingXP = 7000

    set LEGEND_STORMWINDKEEP = Legend.create()
    set LEGEND_STORMWINDKEEP.Unit = gg_unit_h00X_0007
    set LEGEND_STORMWINDKEEP.DeathMessage = "暴风城，暴风王国的首都已经被摧毁"
    set LEGEND_STORMWINDKEEP.IsCapital = true

    set LEGEND_DARKSHIRE = Legend.create()
    set LEGEND_DARKSHIRE.Unit = gg_unit_h03Y_0077
  endfunction

endlibrary