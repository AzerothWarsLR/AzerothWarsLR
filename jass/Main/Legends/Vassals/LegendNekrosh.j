library LegendNekrosh initializer OnInit requires Legend

  globals
    Legend LEGEND_NEKROSH
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_NEKROSH = Legend.create()
    set LEGEND_NEKROSH.UnitType = 'O01Q'
  endfunction

endlibrary