library LegendSaurfang initializer OnInit requires Legend

  globals
    Legend LEGEND_SAURFANG
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_SAURFANG = Legend.create()
    set LEGEND_SAURFANG.UnitType = 'Obla'
  endfunction

endlibrary