library LegendSylvanasV initializer OnInit requires Legend

  globals
    Legend LEGEND_SYLVANASV
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_SYLVANASV = Legend.create()
    set LEGEND_SYLVANASV.UnitType = 'Usyl'
  endfunction

endlibrary