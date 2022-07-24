library LegendLordaeron initializer OnInit requires Legend

  globals
    Legend LEGEND_UTHER
    Legend LEGEND_ARTHAS
    Legend LEGEND_MOGRAINE
    Legend LEGEND_GARITHOS
    Legend LEGEND_GOODCHILD

    Legend LEGEND_CAPITALPALACE
    Legend LEGEND_STRATHOLME
    Legend LEGEND_TYRSHAND
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_MOGRAINE = Legend.create()
    set LEGEND_MOGRAINE.UnitType = 'H01J'
    set LEGEND_MOGRAINE.StartingXP = 2800

    set LEGEND_GARITHOS = Legend.create()
    set LEGEND_GARITHOS.UnitType = 'Hlgr'
    set LEGEND_GARITHOS.StartingXP = 2800

    set LEGEND_GOODCHILD = Legend.create()
    set LEGEND_GOODCHILD.UnitType = 'E00O'
    set LEGEND_GOODCHILD.StartingXP = 2800

    set LEGEND_CAPITALPALACE = Legend.create()
    set LEGEND_CAPITALPALACE.Unit = gg_unit_h000_0406
    set LEGEND_CAPITALPALACE.DeathMessage = "洛丹伦的首都已经被夷为平地，泰纳瑞斯国王已死。"
    set LEGEND_CAPITALPALACE.IsCapital = true

    set LEGEND_STRATHOLME = Legend.create()
    set LEGEND_STRATHOLME.Unit = gg_unit_h01G_0885
    set LEGEND_STRATHOLME.DeathMessage = "宏伟的斯坦索姆已经被摧毁。"
    set LEGEND_STRATHOLME.IsCapital = true

    set LEGEND_TYRSHAND = Legend.create()
    set LEGEND_TYRSHAND.Unit = gg_unit_h030_0839
    set LEGEND_TYRSHAND.DeathMessage = "提尔之手，洛丹伦人类力量的堡垒已经被毁。"
    set LEGEND_TYRSHAND.IsCapital = true

    set LEGEND_UTHER = Legend.create()
    set LEGEND_UTHER.UnitType = 'Huth'
    call LEGEND_UTHER.AddUnitDependency(gg_unit_h000_0406)
    call LEGEND_UTHER.AddUnitDependency(gg_unit_nico_0666)
    set LEGEND_UTHER.DeathMessage = "光明使者乌瑟尔在坚守光明的战斗中战斗了最后一刻。洛丹伦以及全人类在这个黑暗的时刻失去了最为优秀的榜样之一。"
    set LEGEND_UTHER.PlayerColor = PLAYER_COLOR_LIGHT_BLUE
    set LEGEND_UTHER.StartingXP = 1000

    set LEGEND_ARTHAS = Legend.create()
    set LEGEND_ARTHAS.UnitType = 'Hart'
    set LEGEND_ARTHAS.PlayerColor = PLAYER_COLOR_BLUE
    call LEGEND_ARTHAS.AddUnitDependency(LEGEND_STRATHOLME.Unit)
    call LEGEND_ARTHAS.AddUnitDependency(gg_unit_nico_0666)
    set LEGEND_ARTHAS.Essential = true

  endfunction

endlibrary