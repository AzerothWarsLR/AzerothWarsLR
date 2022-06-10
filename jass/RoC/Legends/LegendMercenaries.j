library LegendMercenaries initializer OnInit requires Legend

  globals
    Legend LEGEND_EDWIN
    Legend LEGEND_SNARLMANE
  endglobals

  private function OnInit takes nothing returns nothing

    set LEGEND_EDWIN = Legend.create()
    set LEGEND_EDWIN.UnitType = 'E01H'
    set LEGEND_EDWIN.StartingXP = 8800

    set LEGEND_SNARLMANE = Legend.create()
    set LEGEND_SNARLMANE.UnitType = 'O05S'
    set LEGEND_SNARLMANE.StartingXP = 8800

  endfunction

endlibrary