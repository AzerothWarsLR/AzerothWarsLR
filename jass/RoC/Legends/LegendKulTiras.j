library LegendKultiras initializer OnInit requires Legend

  globals
    Legend LEGEND_ADMIRAL
    Legend LEGEND_LUCILLE
    Legend LEGEND_KATHERINE

    Legend LEGEND_BORALUS
  endglobals

  private function OnInit takes nothing returns nothing 
    set LEGEND_ADMIRAL = Legend.create()
    set LEGEND_ADMIRAL.UnitType = 'Hapm'
    set LEGEND_ADMIRAL.Essential = true

    set LEGEND_LUCILLE = Legend.create()
    set LEGEND_LUCILLE.UnitType = 'E016'
    set LEGEND_LUCILLE.StartingXP = 2800

    set LEGEND_KATHERINE = Legend.create()
    set LEGEND_KATHERINE.UnitType = 'H05L'
    set LEGEND_KATHERINE.StartingXP = 1200

    set LEGEND_BORALUS = Legend.create()
    set LEGEND_BORALUS.Unit = gg_unit_h046_0409
    set LEGEND_BORALUS.DeathMessage = "Boralus Keep has fallen"

  endfunction

endlibrary