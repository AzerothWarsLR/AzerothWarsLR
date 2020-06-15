library LegendIronforge initializer OnInit requires Legend

  globals
    Legend LEGEND_DAGRAN
    Legend LEGEND_FALSTAD
    Legend LEGEND_MAGNI

    Legend LEGEND_GREATFORGE
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_DAGRAN = Legend.create()

    set LEGEND_FALSTAD = Legend.create()

    set LEGEND_MAGNI = Legend.create()

    set LEGEND_GREATFORGE = Legend.create()
    set LEGEND_GREATFORGE.Unit = gg_unit_h001_0180
    set LEGEND_GREATFORGE.DeathMessage = "The Great Forge has been extinguished."
  endfunction

endlibrary