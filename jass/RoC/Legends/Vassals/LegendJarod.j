library LegendJarod initializer OnInit requires Legend

  globals
    Legend LEGEND_JAROD
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_JAROD = Legend.create()
    set LEGEND_JAROD.UnitType = 'O02E'
  endfunction

endlibrary