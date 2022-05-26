library LegendScarlet initializer OnInit requires Legend

  globals
    Legend LEGEND_BRIGITTE
    Legend LEGEND_TIRION
  endglobals

  private function OnInit takes nothing returns nothing

    set LEGEND_BRIGITTE = Legend.create()
    set LEGEND_BRIGITTE.UnitType = 'H00Y'
    set LEGEND_BRIGITTE.StartingXP = 10800

    set LEGEND_TIRION = Legend.create()
    set LEGEND_TIRION.UnitType = 'H09Z'
    set LEGEND_TIRION.StartingXP = 7000

endfunction

endlibrary