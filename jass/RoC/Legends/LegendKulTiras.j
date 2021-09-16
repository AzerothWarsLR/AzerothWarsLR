library LegendKultiras initializer OnInit requires Legend

  globals
    Legend LEGEND_ADMIRAL
  endglobals

  private function OnInit takes nothing returns nothing 
    set LEGEND_ADMIRAL = Legend.create()
    set LEGEND_ADMIRAL.UnitType = 'Hapm'
    set LEGEND_ADMIRAL.Essential = true

  endfunction

endlibrary