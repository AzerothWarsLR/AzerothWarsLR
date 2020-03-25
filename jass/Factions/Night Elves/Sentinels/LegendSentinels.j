library LegendSentinels initializer OnInit requires Legend

  globals
    Legend LEGEND_MAIEV
    Legend LEGEND_ILLIDAN
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_MAIEV = Legend.create()
    set LEGEND_ILLIDAN = Legend.create()
  endfunction

endlibrary