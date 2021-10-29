library LegendCthun initializer OnInit requires Legend

  globals
    Legend LEGEND_SKERAM
    Legend LEGEND_GATESAHNQIRAJ

  endglobals

  private function OnInit takes nothing returns nothing

    set LEGEND_SKERAM = Legend.create()
    set LEGEND_SKERAM.UnitType = 'E005'
    set LEGEND_SKERAM.PlayerColor = PLAYER_COLOR_RED

    set LEGEND_GATESAHNQIRAJ = Legend.create()
    set LEGEND_GATESAHNQIRAJ.Unit = gg_unit_h02U_2413

  endfunction

endlibrary