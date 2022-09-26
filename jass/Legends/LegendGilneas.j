library LegendGilneas initializer OnInit requires Legend

  globals
    Legend LEGEND_TESS
    Legend LEGEND_GENN
    Legend LEGEND_DARIUS
    Legend LEGEND_GOLDRINN
    
    Legend LEGEND_LIGHTDAWN
    Legend LEGEND_GILNEASCASTLE

  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_TESS = Legend.create()
    set LEGEND_TESS.UnitType = 'Ewar'

    set LEGEND_GOLDRINN = Legend.create()
    set LEGEND_GOLDRINN.UnitType = 'E01E'
    set LEGEND_GOLDRINN.StartingXP = 8800

    set LEGEND_GENN = Legend.create()
    set LEGEND_GENN.UnitType = 'Hhkl'
    set LEGEND_GENN.StartingXP = 2800

    set LEGEND_DARIUS = Legend.create()
    set LEGEND_DARIUS.UnitType = 'Hpb2'

    set LEGEND_GILNEASCASTLE = Legend.create()
    set LEGEND_GILNEASCASTLE.Unit = gg_unit_h04I_1276
    set LEGEND_GILNEASCASTLE.DeathMessage = "The Gilneas castle has fallen"
    set LEGEND_GILNEASCASTLE.IsCapital = true
  endfunction

endlibrary