library LegendNaga initializer OnInit requires Legend

  globals
    Legend LEGEND_ILLIDAN
    Legend LEGEND_OBELISK
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ILLIDAN = Legend.create()
    set LEGEND_ILLIDAN.Unit = gg_unit_Eill_0748

    set LEGEND_OBELISK = Legend.create()
    set LEGEND_OBELISK.Unit = gg_unit_nico_3620
    set LEGEND_OBELISK.DeathMessage = "Illidan has died"
    set LEGEND_OBELISK.IsCapital = true
  endfunction

endlibrary