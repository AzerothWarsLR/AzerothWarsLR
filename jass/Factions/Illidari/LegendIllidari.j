library LegendIllidari initializer OnInit requires Legend

  globals
    Legend LEGEND_KAEL
    Legend LEGEND_VASHJ
    Legend LEGEND_AKAMA
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_KAEL = Legend.create()
    set LEGEND_KAEL.Unit = gg_unit_Hkal_1946

    set LEGEND_VASHJ = Legend.create()
    set LEGEND_VASHJ.Unit = gg_unit_Hvsh_3282

    set LEGEND_AKAMA = Legend.create()
    set LEGEND_AKAMA.Unit = gg_unit_Naka_3361
  endfunction

endlibrary