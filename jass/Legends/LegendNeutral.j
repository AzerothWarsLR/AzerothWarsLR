library LegendNeutral initializer OnInit requires Legend

  globals
    Legend LEGEND_RAGNAROS
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_RAGNAROS = Legend.create()
  endfunction

endlibrary