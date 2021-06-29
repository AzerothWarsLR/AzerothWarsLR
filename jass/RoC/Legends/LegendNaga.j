library LegendNaga initializer OnInit requires Legend

  globals
    Legend LEGEND_ILLIDAN
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ILLIDAN = Legend.create()
    set LEGEND_ILLIDAN.Unit = gg_unit_Eill_0748
  endfunction

endlibrary