library LegendLorthemar initializer OnInit requires Legend

  globals
    Legend LEGEND_LORTHEMAR
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_LORTHEMAR = Legend.create()
    set LEGEND_LORTHEMAR.UnitType = 'H02E'
  endfunction

endlibrary