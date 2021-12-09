library LegendDraenei initializer OnInit requires Legend

  globals
    Legend LEGEND_VELEN
    Legend LEGEND_MARAAD
    Legend LEGEND_NOBUNDO

    Legend LEGEND_EXODAR
    Legend LEGEND_EXODARSHIP
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_VELEN = Legend.create()
    set LEGEND_VELEN.UnitType = 'E01I'

    set LEGEND_NOBUNDO = Legend.create()
    set LEGEND_NOBUNDO.UnitType = 'E01J'

    set LEGEND_EXODAR = Legend.create()
    set LEGEND_EXODAR.Unit = gg_unit_o05E_1583
    set LEGEND_EXODAR.IsCapital = true

    set LEGEND_EXODARSHIP = Legend.create()
    set LEGEND_EXODARSHIP.Unit = gg_unit_h09W_3303

    set LEGEND_MARAAD = Legend.create()
    set LEGEND_MARAAD.UnitType = 'H09S'
  endfunction

endlibrary