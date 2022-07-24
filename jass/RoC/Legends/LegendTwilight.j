library LegendTwilight initializer OnInit requires Legend

  globals
    Legend LEGEND_DEATHWING
    Legend LEGEND_FELUDIUS
    Legend LEGEND_IGNACIOUS
    Legend LEGEND_AZIL

    Legend LEGEND_TWILIGHTCITADEL
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_TWILIGHTCITADEL = Legend.create()
    set LEGEND_TWILIGHTCITADEL.Unit = gg_unit_h05U_0015
    set LEGEND_TWILIGHTCITADEL.DeathMessage = "暮光堡垒已经倒塌。土地也开始恢复，尽管这个过程可能需要数十年才能让那散发的古神臭味从暮光高地上完全消散。"
    set LEGEND_TWILIGHTCITADEL.IsCapital = true
   
    set LEGEND_DEATHWING = Legend.create()
    set LEGEND_DEATHWING.Unit = gg_unit_u01Y_0071
    set LEGEND_DEATHWING.PermaDies = true
    set LEGEND_DEATHWING.DeathMessage = "黑色天灾死亡之翼不复存在。毁灭者终于被毁灭了。"

    set LEGEND_AZIL = Legend.create()
    set LEGEND_AZIL.UnitType = 'H08Q'
    set LEGEND_AZIL.StartingXP = 1800
    call LEGEND_AZIL.AddUnitDependency(LEGEND_TWILIGHTCITADEL.Unit)

    set LEGEND_FELUDIUS = Legend.create()
    set LEGEND_FELUDIUS.UnitType = 'U01S'
    set LEGEND_FELUDIUS.StartingXP = 2800

    set LEGEND_IGNACIOUS = Legend.create()
    set LEGEND_IGNACIOUS.UnitType = 'O04H'
    set LEGEND_IGNACIOUS.StartingXP = 2800

endfunction

endlibrary