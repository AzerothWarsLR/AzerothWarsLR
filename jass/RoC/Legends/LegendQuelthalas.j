library LegendQuelthalas initializer OnInit requires Legend

  globals
    Legend LEGEND_ANASTERIAN
    Legend LEGEND_ROMMATH
    Legend LEGEND_JENNALLA
    Legend LEGEND_SYLVANAS
    Legend LEGEND_KORIALSTRASZ
    Legend LEGEND_KAEL
    Legend LEGEND_LORTHEMAR
    Legend LEGEND_KILJAEDEN
    Legend LEGEND_PATHALEON

    Legend LEGEND_SILVERMOON
    Legend LEGEND_SUNWELL

    Legend LEGEND_TEMPESTKEEP
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_SILVERMOON = Legend.create()
    set LEGEND_SILVERMOON.Unit = gg_unit_h003_0418
    set LEGEND_SILVERMOON.DeathMessage = "高等精灵的壮丽城市银月城已经被她的敌人摧毁"
    set LEGEND_SILVERMOON.IsCapital = true

    set LEGEND_SUNWELL = Legend.create()
    set LEGEND_SUNWELL.Unit = gg_unit_n001_0165
    set LEGEND_SUNWELL.Capturable = true
    set LEGEND_SUNWELL.IsCapital = true

    set LEGEND_TEMPESTKEEP = Legend.create()
    set LEGEND_TEMPESTKEEP.Unit = gg_unit_n05X_1493

    set LEGEND_ANASTERIAN = Legend.create()
    set LEGEND_ANASTERIAN.UnitType = 'H00Q'
    set LEGEND_ANASTERIAN.PlayerColor = PLAYER_COLOR_MAROON
    call LEGEND_ANASTERIAN.AddUnitDependency(LEGEND_SUNWELL.Unit)
    set LEGEND_ANASTERIAN.Essential = true
    set LEGEND_ANASTERIAN.StartingXP = 1000

    set LEGEND_ROMMATH = Legend.create()
    set LEGEND_ROMMATH.UnitType = 'H04F'
    set LEGEND_ROMMATH.StartingXP = 1800

    set LEGEND_JENNALLA = Legend.create()
    set LEGEND_JENNALLA.UnitType = 'H02B'

    set LEGEND_PATHALEON = Legend.create()
    set LEGEND_PATHALEON.UnitType = 'H098'
    set LEGEND_PATHALEON.StartingXP = 1800
    
    set LEGEND_SYLVANAS = Legend.create()
    set LEGEND_SYLVANAS.UnitType = 'Hvwd'
    set LEGEND_SYLVANAS.PlayerColor = PLAYER_COLOR_GREEN

    set LEGEND_KAEL = Legend.create()
    set LEGEND_KAEL.PlayerColor = PLAYER_COLOR_RED
    set LEGEND_KAEL.UnitType = 'Hkal'
    set LEGEND_KAEL.StartingXP = 1800

    set LEGEND_LORTHEMAR = Legend.create()
    set LEGEND_LORTHEMAR.UnitType = 'H02E'
    set LEGEND_LORTHEMAR.StartingXP = 2800

    set LEGEND_KILJAEDEN = Legend.create()
    set LEGEND_KILJAEDEN.UnitType = 'U004'
    set LEGEND_KILJAEDEN.PermaDies = true
    set LEGEND_KILJAEDEN.StartingXP = 10800
    set LEGEND_KILJAEDEN.DeathMessage = "欺诈者基尔加丹已经被消灭，但对于血精灵来说为时已晚，他们那被恶魔污染了的血脉将继续延续下去。"
  endfunction

endlibrary