library LegendChogall initializer OnInit requires Legend

  globals
    Legend LEGEND_CHOGALL
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_CHOGALL = Legend.create()
    set LEGEND_CHOGALL.UnitType = 'O01P'
  endfunction

endlibrary