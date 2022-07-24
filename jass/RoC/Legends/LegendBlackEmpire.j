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
    set LEGEND_YOGG.DeathMessage = "千面之魔尤格萨隆已经被彻底击败。无数被祂吞进肚子内的灵魂终于得以报仇。"

    set LEGEND_VOLAZJ = Legend.create()
    set LEGEND_VOLAZJ.UnitType = 'E01D'

    set LEGEND_ZAKAJZ = Legend.create()
    set LEGEND_ZAKAJZ.UnitType = 'U00P'
    set LEGEND_ZAKAJZ.StartingXP = 8800

  endfunction

endlibrary