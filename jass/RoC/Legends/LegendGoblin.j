library LegendGoblin initializer OnInit requires Legend

  globals
    Legend LEGEND_GALLYWIX
    Legend LEGEND_NOGGENFOGGER
    Legend LEGEND_GAZLOWE

  endglobals

  private function OnInit takes nothing returns nothing

    set LEGEND_GALLYWIX = Legend.create()
    set LEGEND_GALLYWIX.UnitType = 'O04N'

    set LEGEND_NOGGENFOGGER = Legend.create()
    set LEGEND_NOGGENFOGGER.UnitType = 'Nalc'
    set LEGEND_NOGGENFOGGER.StartingXP = 800

    set LEGEND_GAZLOWE = Legend.create()
    set LEGEND_GAZLOWE.UnitType = 'Ntin'
    set LEGEND_GAZLOWE.StartingXP = 1800

  endfunction

endlibrary