library LegendIronforge initializer OnInit requires Legend

  globals
    Legend LEGEND_DAGRAN
    Legend LEGEND_FALSTAD
    Legend LEGEND_MAGNI

    Legend LEGEND_GREATFORGE
    Legend LEGEND_THELSAMAR
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_DAGRAN = Legend.create()
    set LEGEND_DAGRAN.UnitType = 'H03G'
    set LEGEND_DAGRAN.StartingXP = 10800

    set LEGEND_FALSTAD = Legend.create()
    set LEGEND_FALSTAD.UnitType = 'H028'
    set LEGEND_FALSTAD.StartingXP = 15400

    set LEGEND_MAGNI = Legend.create()
    set LEGEND_MAGNI.Unit = gg_unit_H00S_1948
    call LEGEND_MAGNI.AddUnitDependency(gg_unit_h001_0180)
    set LEGEND_MAGNI.DeathMessage = "King Magni Bronzebeard has died."

    set LEGEND_GREATFORGE = Legend.create()
    set LEGEND_GREATFORGE.Unit = gg_unit_h001_0180
    set LEGEND_GREATFORGE.DeathMessage = "The Great Forge has been extinguished."

    set LEGEND_THELSAMAR = Legend.create()
    set LEGEND_THELSAMAR.Unit = gg_unit_h05H_1847
  endfunction

endlibrary