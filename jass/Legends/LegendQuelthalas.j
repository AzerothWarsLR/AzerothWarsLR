library LegendQuelthalas initializer OnInit requires Legend

  globals
    Legend LEGEND_ROMMATH
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ROMMATH = Legend.create()
  endfunction

endlibrary