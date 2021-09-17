library LegendTroll initializer OnInit requires Legend

  globals
    Legend LEGEND_PRIEST
  endglobals

  private function OnInit takes nothing returns nothing 
    set LEGEND_PRIEST = Legend.create()
    set LEGEND_PRIEST.UnitType = 'O01J'
    set LEGEND_PRIEST.Essential = true

  endfunction

endlibrary