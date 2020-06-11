library LegendIronforge initializer OnInit requires Legend

  globals
    Legend LEGEND_DAGRAN
    Legend LEGEND_FALSTAD
    Legend LEGEND_MAGNI
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_DAGRAN = Legend.create()

    set LEGEND_FALSTAD = Legend.create()

    set LEGEND_MAGNI = Legend.create()
  endfunction

endlibrary