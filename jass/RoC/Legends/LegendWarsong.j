library LegendWarsong initializer OnInit requires Legend

  globals
    Legend LEGEND_GROM
    Legend LEGEND_JERGOSH
    Legend LEGEND_MANNOROTH
    Legend LEGEND_STONEMAUL
    Legend LEGEND_ENCAMPMENT
    Legend LEGEND_LUMBERCAMP
    Legend LEGEND_GAHZRILLA
    Legend LEGEND_CHEN
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_GAHZRILLA = Legend.create()
    set LEGEND_GAHZRILLA.UnitType = 'H06Q'
    set LEGEND_GAHZRILLA.PlayerColor = PLAYER_COLOR_SNOW
    set LEGEND_GAHZRILLA.StartingXP = 1800

    set LEGEND_CHEN = Legend.create()
    set LEGEND_CHEN.UnitType = 'Nsjs'
    set LEGEND_CHEN.StartingXP = 1000

    set LEGEND_JERGOSH = Legend.create()
    set LEGEND_JERGOSH.UnitType = 'Oths'

    set LEGEND_MANNOROTH = Legend.create()
    set LEGEND_MANNOROTH.UnitType = 'Nman'

    set LEGEND_STONEMAUL = Legend.create()
    set LEGEND_STONEMAUL.Unit = gg_unit_o004_0169
    set LEGEND_STONEMAUL.DeathMessage = "The fortress of the Stonemaul Clan has fallen."
    set LEGEND_STONEMAUL.IsCapital = true

    set LEGEND_ENCAMPMENT = Legend.create()
    //set LEGEND_ENCAMPMENT.Unit = gg_unit_o02K_0450

    set LEGEND_LUMBERCAMP = Legend.create()
    set LEGEND_LUMBERCAMP.Unit = gg_unit_o01I_1103
    set LEGEND_LUMBERCAMP.IsCapital = true

    set LEGEND_GROM = Legend.create()
    set LEGEND_GROM.Unit = gg_unit_Ogrh_0249
    call LEGEND_GROM.AddUnitDependency(LEGEND_STONEMAUL.Unit)
    call LEGEND_GROM.AddUnitDependency(LEGEND_LUMBERCAMP.Unit)
    //call LEGEND_GROM.AddUnitDependency(LEGEND_ENCAMPMENT.Unit)
    set LEGEND_GROM.DeathMessage = "Grom Hellscream lies broken on the battlefield. It is yet to be seen whether or not the Warsong Clan can survive without his strong leadership."    
    set LEGEND_GROM.Essential = true
  endfunction

endlibrary