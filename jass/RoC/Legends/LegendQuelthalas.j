library LegendQuelthalas initializer OnInit requires Legend

  globals
    Legend LEGEND_ANASTERIAN
    Legend LEGEND_ROMMATH
    Legend LEGEND_JENNALLA
    Legend LEGEND_SYLVANAS
    Legend LEGEND_KORIALSTRASZ
    Legend LEGEND_KAEL

    Legend LEGEND_SILVERMOON
    Legend LEGEND_SUNWELL
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ANASTERIAN = Legend.create()
    set LEGEND_ANASTERIAN.Unit = gg_unit_H00Q_0630
    set LEGEND_ANASTERIAN.PlayerColor = PLAYER_COLOR_MAROON

    set LEGEND_ROMMATH = Legend.create()
    set LEGEND_ROMMATH.UnitType = 'H04F'

    set LEGEND_JENNALLA = Legend.create()
    set LEGEND_JENNALLA.UnitType = 'H02B'
    
    set LEGEND_SYLVANAS = Legend.create()
    set LEGEND_SYLVANAS.Unit = gg_unit_Hvwd_1515
    set LEGEND_SYLVANAS.PlayerColor = PLAYER_COLOR_GREEN

    set LEGEND_SILVERMOON = Legend.create()
    set LEGEND_SILVERMOON.Unit = gg_unit_h003_0418
    set LEGEND_SILVERMOON.DeathMessage = "The grand city of the high elves, Silvermoon, has been crushed by her enemies."

    set LEGEND_SUNWELL = Legend.create()
    set LEGEND_SUNWELL.Unit = gg_unit_n001_0165
    set LEGEND_SUNWELL.Capturable = true

    set LEGEND_KORIALSTRASZ = Legend.create()
    set LEGEND_KORIALSTRASZ.UnitType = 'Edem'
    set LEGEND_KORIALSTRASZ.PlayerColor = PLAYER_COLOR_RED

    set LEGEND_KAEL = Legend.create()
    set LEGEND_KAEL.PlayerColor = PLAYER_COLOR_RED
    set LEGEND_KAEL.UnitType = 'Hkal'
    set LEGEND_KAEL.StartingXP = 7000
  endfunction

endlibrary