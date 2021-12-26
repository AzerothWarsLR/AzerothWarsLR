library LegendBlackEmpire initializer OnInit requires Legend

  globals
    Legend LEGEND_YOR
    Legend LEGEND_YOGG
  endglobals

  private function OnInit takes nothing returns nothing

    set LEGEND_YOGG = Legend.create()
    set LEGEND_YOGG.Unit = gg_unit_U02C_2829
    set LEGEND_YOGG.PermaDies = true
    set LEGEND_YOGG.DeathMessage = "The Old God Yogg-Saron has fallen"

  endfunction

endlibrary