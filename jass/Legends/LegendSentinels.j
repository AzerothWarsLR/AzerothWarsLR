library LegendSentinels initializer OnInit requires Legend

  globals
    Legend LEGEND_MAIEV
    Legend LEGEND_TYRANDE
    Legend LEGEND_SHANDRIS
    Legend LEGEND_JALIN
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_MAIEV = Legend.create()
    set LEGEND_MAIEV.Unit = gg_unit_Ewrd_1259

    set LEGEND_TYRANDE = Legend.create()
    set LEGEND_TYRANDE.Unit = gg_unit_Etyr_1241

    set LEGEND_SHANDRIS = Legend.create()
    set LEGEND_SHANDRIS.Unit = gg_unit_E002_1221

    set LEGEND_JALIN = Legend.create()
    set LEGEND_JALIN.UnitType = 'E00S'
  endfunction

endlibrary