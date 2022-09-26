library LegendDraenei initializer OnInit requires Legend

  globals
    Legend LEGEND_VELEN
    Legend LEGEND_MARAAD
    Legend LEGEND_NOBUNDO

    Legend LEGEND_EXODAR
    Legend LEGEND_EXODARSHIP

    Legend LEGEND_SHATTRAH
    Legend LEGEND_FARAHLON
    Legend LEGEND_TUUREM
    Legend LEGEND_TELREDOR
    Legend LEGEND_HALAAR
  endglobals

  private function OnInit takes nothing returns nothing

    set LEGEND_NOBUNDO = Legend.create()
    set LEGEND_NOBUNDO.UnitType = 'E01J'
    set LEGEND_NOBUNDO.StartingXP = 1800

    set LEGEND_EXODAR = Legend.create()
    set LEGEND_EXODAR.Unit = gg_unit_o05E_1583
    set LEGEND_EXODAR.IsCapital = true

    set LEGEND_EXODARSHIP = Legend.create()
    set LEGEND_EXODARSHIP.Unit = gg_unit_h09W_3303

    set LEGEND_MARAAD = Legend.create()
    set LEGEND_MARAAD.StartingXP = 1800
    set LEGEND_MARAAD.UnitType = 'H09S'

    set LEGEND_VELEN = Legend.create()
    set LEGEND_VELEN.UnitType = 'E01I'
    call LEGEND_VELEN.AddUnitDependency(LEGEND_EXODAR.Unit)
    call LEGEND_VELEN.AddUnitDependency(LEGEND_EXODARSHIP.Unit)

    set LEGEND_SHATTRAH = Legend.create()
    set LEGEND_SHATTRAH.Unit = gg_unit_h0AH_2379

    set LEGEND_FARAHLON = Legend.create()
    set LEGEND_FARAHLON.Unit = gg_unit_h0AF_2366

    set LEGEND_TELREDOR = Legend.create()
    set LEGEND_TELREDOR.Unit = gg_unit_h0AG_2567

    set LEGEND_TUUREM = Legend.create()
    set LEGEND_TUUREM.Unit = gg_unit_h0AD_2508

    set LEGEND_HALAAR = Legend.create()
    set LEGEND_HALAAR.Unit = gg_unit_h0AE_2561
  endfunction

endlibrary