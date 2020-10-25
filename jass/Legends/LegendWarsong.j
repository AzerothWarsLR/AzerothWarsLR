library LegendWarsong initializer OnInit requires Legend

  globals
    Legend LEGEND_GROM
    Legend LEGEND_REXXAR
    Legend LEGEND_JERGOSH
    Legend LEGEND_MANNOROTH
    Legend LEGEND_STONEMAUL
    Legend LEGEND_ENCAMPMENT
    Legend LEGEND_LUMBERCAMP
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_GROM = Legend.create()
    set LEGEND_GROM.Unit = gg_unit_Ogrh_0249
    call LEGEND_GROM.AddUnitDependency(gg_unit_o00C_1292)
    call LEGEND_GROM.AddUnitDependency(gg_unit_o02K_0450) 
    call LEGEND_GROM.AddUnitDependency(gg_unit_o004_0169)
    set LEGEND_GROM.DeathMessage = "Grom Hellscream lies broken on the battlefield. It is yet to be seen whether or not the Warsong Clan can survive without his strong leadership."

    set LEGEND_REXXAR = Legend.create()
    set LEGEND_REXXAR.Unit = gg_unit_Orex_0312

    set LEGEND_JERGOSH = Legend.create()
    set LEGEND_JERGOSH.UnitType = 'Oths'

    set LEGEND_MANNOROTH = Legend.create()
    set LEGEND_MANNOROTH.UnitType = 'Nman'

    set LEGEND_STONEMAUL = Legend.create()
    set LEGEND_STONEMAUL.Unit = gg_unit_o004_0169
    set LEGEND_STONEMAUL.DeathMessage = "The fortress of the Stonemaul Clan has fallen."

    set LEGEND_ENCAMPMENT = Legend.create()
    set LEGEND_ENCAMPMENT.Unit = gg_unit_o02K_0450

    set LEGEND_LUMBERCAMP = Legend.create()
    set LEGEND_LUMBERCAMP.Unit = gg_unit_o01I_0449
  endfunction

endlibrary