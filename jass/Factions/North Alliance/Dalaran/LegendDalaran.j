library LegendDalaran initializer OnInit requires Legend

  globals
    Legend LEGEND_ANTONIDAS
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ANTONIDAS = Legend.create()
    set LEGEND_ANTONIDAS.Unit = gg_unit_Hant_1675
    call LEGEND_ANTONIDAS.AddUnitDependency(gg_unit_h002_0230)
    set LEGEND_ANTONIDAS.DeathMessage = "Archmage Antonidas has been cut down, his vast knowledge forever lost with his death. The mages of Dalaran have lost their brightest mind."
  endfunction

endlibrary