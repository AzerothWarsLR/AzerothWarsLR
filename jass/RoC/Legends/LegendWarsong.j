library LegendWarsong initializer OnInit requires Legend

  globals
    Legend LEGEND_GROM
    Legend LEGEND_JERGOSH
    Legend LEGEND_MANNOROTH
    Legend LEGEND_STONEMAUL
    Legend LEGEND_ENCAMPMENT
    Legend LEGEND_CHEN
  endglobals

  private function OnInit takes nothing returns nothing

    set LEGEND_CHEN = Legend.create()
    set LEGEND_CHEN.UnitType = 'Nsjs'

    set LEGEND_JERGOSH = Legend.create()
    set LEGEND_JERGOSH.UnitType = 'Oths'

    set LEGEND_MANNOROTH = Legend.create()
    set LEGEND_MANNOROTH.UnitType = 'Nman'

    set LEGEND_STONEMAUL = Legend.create()
    set LEGEND_STONEMAUL.Unit = gg_unit_o004_0169
    set LEGEND_STONEMAUL.DeathMessage = "The fortress of the Stonemaul Clan has fallen."
    set LEGEND_STONEMAUL.IsCapital = true

    set LEGEND_ENCAMPMENT = Legend.create()

    set LEGEND_GROM = Legend.create()
    set LEGEND_GROM.UnitType = 'Ogrh'
  endfunction

endlibrary