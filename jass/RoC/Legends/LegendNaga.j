library LegendNaga initializer OnInit requires Legend

  globals
    Legend LEGEND_ILLIDAN
    Legend LEGEND_VASHJ
    Legend LEGEND_NAJENTUS
    Legend LEGEND_AZSHARA
    Legend LEGEND_NZOTH
    Legend LEGEND_ALTRUIS
    Legend LEGEND_AKAMA
    Legend LEGEND_NAZJAR
    
    Legend LEGEND_NAZJATAR
    Legend LEGEND_VAULT
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ILLIDAN = Legend.create()
    set LEGEND_ILLIDAN.Unit = gg_unit_Eill_0748
    set LEGEND_ILLIDAN.PlayerColor = PLAYER_COLOR_PURPLE

    set LEGEND_VASHJ = Legend.create()
    set LEGEND_VASHJ.UnitType = 'Hvsh'
    set LEGEND_VASHJ.StartingXP = 2800

    set LEGEND_AZSHARA = Legend.create()
    set LEGEND_AZSHARA.UnitType = 'H08U'

    set LEGEND_NAZJAR = Legend.create()
    set LEGEND_NAZJAR.UnitType = 'H0A5'

    set LEGEND_NAJENTUS = Legend.create()
    set LEGEND_NAJENTUS.UnitType = 'U00S'
    set LEGEND_NAJENTUS.StartingXP = 2800

    set LEGEND_ALTRUIS = Legend.create()
    set LEGEND_ALTRUIS.UnitType = 'E015'
    set LEGEND_ALTRUIS.StartingXP = 4000

    set LEGEND_AKAMA = Legend.create()
    set LEGEND_AKAMA.UnitType = 'Naka'
    set LEGEND_AKAMA.StartingXP = 4000

    set LEGEND_NZOTH = Legend.create()
    set LEGEND_NZOTH.Unit = gg_unit_U01Z_1237
    set LEGEND_NZOTH.DeathMessage = "腐蚀者恩佐斯在实施他最后的计谋前等待了千万年。然而一切都是徒劳的。恩佐斯已死，他永远没有机会再见证他黑暗帝国的真正实现。"
    set LEGEND_NZOTH.PermaDies = true

    set LEGEND_NAZJATAR = Legend.create()
    set LEGEND_NAZJATAR.Unit = gg_unit_n045_3377
    set LEGEND_NAZJATAR.DeathMessage = "艾萨拉女王和纳沙塔尔帝国的所在地永恒宫殿已经被摧毁。"
    set LEGEND_NAZJATAR.IsCapital = true

    set LEGEND_VAULT = Legend.create()
    set LEGEND_VAULT.Unit = gg_unit_n05A_2845
    set LEGEND_VAULT.DeathMessage = "大图书馆已经被摧毁，存在于其中的知识也随之消逝。"
    set LEGEND_VAULT.IsCapital = true
  endfunction

endlibrary