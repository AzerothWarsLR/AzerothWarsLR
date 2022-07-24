library LegendForsaken initializer OnInit requires Legend

  globals
    Legend LEGEND_SYLVANASV
    Legend LEGEND_SCHOLOMANCE
    Legend LEGEND_UNDERCITY
    Legend LEGEND_VARIMATHRAS
    Legend LEGEND_NATHANOS
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_SYLVANASV = Legend.create()
    set LEGEND_SYLVANASV.UnitType = 'Usyl'
    set LEGEND_SYLVANASV.StartingXP = 15400

    set LEGEND_NATHANOS = Legend.create()
    set LEGEND_NATHANOS.UnitType = 'H049'
    set LEGEND_NATHANOS.StartingXP = 4000

    set LEGEND_VARIMATHRAS = Legend.create()
    set LEGEND_VARIMATHRAS.UnitType = 'Uvar'
    set LEGEND_VARIMATHRAS.PlayerColor = PLAYER_COLOR_RED

    set LEGEND_SCHOLOMANCE = Legend.create()
    set LEGEND_SCHOLOMANCE.Unit = gg_unit_u012_1149
    set LEGEND_SCHOLOMANCE.DeathMessage = "Scholomance, the center of the Scourge's operations in Lordaeron, has been destroyed."

    set LEGEND_UNDERCITY = Legend.create()
    set LEGEND_UNDERCITY.Unit = gg_unit_h08S_0502
    set LEGEND_UNDERCITY.DeathMessage = "The Undercity, the home of the Forsaken, has been decimated."
endfunction

endlibrary