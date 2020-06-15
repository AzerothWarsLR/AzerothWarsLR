library LegendQuelthalas initializer OnInit requires Legend

  globals
    Legend LEGEND_ROMMATH

    Legend LEGEND_SILVERMOON
    Legend LEGEND_SUNWELL
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ROMMATH = Legend.create()
    set LEGEND_ROMMATH.UnitType = 'H04F'

    set LEGEND_SILVERMOON = Legend.create()
    set LEGEND_SILVERMOON.Unit = gg_unit_h003_0418
    set LEGEND_SILVERMOON.DeathMessage = "The grand city of the high elves, Silvermoon, has been crushed by her enemies."

    set LEGEND_SUNWELL = Legend.create()
    set LEGEND_SUNWELL.Unit = gg_unit_n001_0165
    set LEGEND_SUNWELL.Capturable = true
  endfunction

endlibrary