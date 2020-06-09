library LegendNeutral initializer OnInit requires Legend

  globals
    Legend LEGEND_RAGNAROS
    Legend LEGEND_KARAZHAN
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_RAGNAROS = Legend.create()
    set LEGEND_KARAZHAN = Legend.create()
  endfunction

endlibrary