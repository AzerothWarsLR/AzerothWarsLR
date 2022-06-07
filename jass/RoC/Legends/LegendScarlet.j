library LegendScarlet initializer OnInit requires Legend

  globals
    Legend LEGEND_BRIGITTE
    Legend LEGEND_TIRION
    Legend LEGEND_RENAULT
    Legend LEGEND_SAIDEN
  endglobals

  private function OnInit takes nothing returns nothing

    set LEGEND_BRIGITTE = Legend.create()
    set LEGEND_BRIGITTE.UnitType = 'H00Y'
    set LEGEND_BRIGITTE.StartingXP = 10800

    set LEGEND_RENAULT = Legend.create()
    set LEGEND_RENAULT.UnitType = 'H0A2'
    set LEGEND_RENAULT.StartingXP = 1000

    set LEGEND_SAIDEN = Legend.create()
    set LEGEND_SAIDEN.UnitType = 'H08G'
    set LEGEND_SAIDEN.StartingXP = 1000

endfunction

endlibrary