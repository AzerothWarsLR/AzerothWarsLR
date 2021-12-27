library LegendBlackEmpire initializer OnInit requires Legend

  globals
    Legend LEGEND_YOGG
    Legend LEGEND_VOLAZJ
    Legend LEGEND_ZAKAJZ
  endglobals

  private function OnInit takes nothing returns nothing

    set LEGEND_YOGG = Legend.create()
    set LEGEND_YOGG.Unit = gg_unit_U02C_2829
    set LEGEND_YOGG.PermaDies = true
    set LEGEND_YOGG.DeathMessage = "The Old God Yogg-Saron has fallen"

    set LEGEND_VOLAZJ = Legend.create()
    set LEGEND_VOLAZJ.UnitType = 'E01D'

    set LEGEND_ZAKAJZ = Legend.create()
    set LEGEND_ZAKAJZ.UnitType = 'U00P'
    set LEGEND_ZAKAJZ.StartingXP = 8800

  endfunction

endlibrary