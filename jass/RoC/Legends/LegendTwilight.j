library LegendTwilight initializer OnInit requires Legend

  globals
    Legend LEGEND_DEATHWING
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_DEATHWING = Legend.create()
    set LEGEND_DEATHWING.Unit = gg_unit_u01Y_0071
    set LEGEND_DEATHWING.PermaDies = true
    set LEGEND_DEATHWING.DeathMessage = "Deathwing, The Black Scourge, is no more. The Destroyer has finally been defeated."
endfunction

endlibrary