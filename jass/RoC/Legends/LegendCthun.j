library LegendCthun initializer OnInit requires Legend

  globals
    Legend LEGEND_SKERAM
    Legend LEGEND_GATESAHNQIRAJ
    Legend LEGEND_CTHUN
    Legend LEGEND_YOR

  endglobals

  private function OnInit takes nothing returns nothing

    set LEGEND_CTHUN = Legend.create()
    set LEGEND_CTHUN.Unit = gg_unit_U00R_0609
    set LEGEND_CTHUN.PermaDies = true
    set LEGEND_CTHUN.DeathMessage = "安其拉之神克苏恩曾经被泰坦击败过一次，之后又被团结的巨龙们再次击败。今天，祂经历了祂的第三次失败和第一次真正的死亡。"

    set LEGEND_SKERAM = Legend.create()
    set LEGEND_SKERAM.UnitType = 'E005'
    set LEGEND_SKERAM.PlayerColor = PLAYER_COLOR_RED
    set LEGEND_SKERAM.Name = "预言者斯克拉姆"

    set LEGEND_GATESAHNQIRAJ = Legend.create()
    set LEGEND_GATESAHNQIRAJ.Unit = gg_unit_h02U_2413

    set LEGEND_YOR = Legend.create()
    set LEGEND_YOR.UnitType = 'U02A'
    set LEGEND_YOR.StartingXP = 8800

  endfunction

endlibrary