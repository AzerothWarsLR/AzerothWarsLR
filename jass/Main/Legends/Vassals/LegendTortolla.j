library LegendTortolla initializer OnInit requires Legend

  globals
    Legend LEGEND_TORTOLLA
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_TORTOLLA = Legend.create()
    set LEGEND_TORTOLLA.UnitType = 'H04U'
  endfunction

endlibrary