library LegendNaga initializer OnInit requires Legend

  globals
    Legend LEGEND_ILLIDAN
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ILLIDAN = Legend.create()
    set LEGEND_ILLIDAN.UnitType = 'Eill'
  endfunction

endlibrary