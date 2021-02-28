library LegendNathanos initializer OnInit requires Legend

  globals
    Legend LEGEND_NATHANOS
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_NATHANOS = Legend.create()
    set LEGEND_NATHANOS.UnitType = 'H049'
  endfunction

endlibrary