library LegendLegion initializer OnInit requires Legend

  globals
    Legend LEGEND_ARCHIMONDE
    Legend LEGEND_ANETHERON
    Legend LEGEND_TICHONDRIUS
    Legend LEGEND_MALGANIS
    Legend LEGEND_LILIAN

  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ARCHIMONDE = Legend.create()
    set LEGEND_ARCHIMONDE.Unit = gg_unit_Uwar_2344
    set LEGEND_ARCHIMONDE.PermaDies = true
    set LEGEND_ARCHIMONDE.DeathMessage = "污染者阿克蒙德已经被逐出艾泽拉斯，这标志着他第二次失败的入侵。"
    set LEGEND_ARCHIMONDE.StartingXP = 10800
    set LEGEND_ARCHIMONDE.Essential = true
    
    set LEGEND_ANETHERON = Legend.create()
    set LEGEND_ANETHERON.UnitType = 'U00L'
    set LEGEND_ANETHERON.PlayerColor = PLAYER_COLOR_ORANGE
    set LEGEND_ANETHERON.StartingXP = 1800

    set LEGEND_LILIAN = Legend.create()
    set LEGEND_LILIAN.UnitType = 'E01O'
    set LEGEND_LILIAN.StartingXP = 4000

    set LEGEND_TICHONDRIUS = Legend.create()
    set LEGEND_TICHONDRIUS.UnitType = 'Utic'
    set LEGEND_TICHONDRIUS.PlayerColor = PLAYER_COLOR_RED

    set LEGEND_MALGANIS = Legend.create()
    set LEGEND_MALGANIS.UnitType = 'Umal'
    set LEGEND_MALGANIS.PlayerColor = PLAYER_COLOR_GREEN

  endfunction

endlibrary