library LegendGilneas initializer OnInit requires Legend

  globals
    Legend LEGEND_TESS
    Legend LEGEND_GENN
    Legend LEGEND_DARIUS
    
    Legend LEGEND_LIGHTDAWN
    Legend LEGEND_GILNEASCASTLE
    Legend LEGEND_OBELISK2

  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_TESS = Legend.create()
    set LEGEND_TESS.Unit = gg_unit_Ewar_0424

    set LEGEND_GENN = Legend.create()
    set LEGEND_GENN.Unit = gg_unit_Hhkl_1500

    set LEGEND_DARIUS = Legend.create()
    set LEGEND_DARIUS.Unit = gg_unit_Hpb2_3787

    set LEGEND_LIGHTDAWN = Legend.create()
    set LEGEND_LIGHTDAWN.Unit = gg_unit_h057_3921
    set LEGEND_LIGHTDAWN.DeathMessage = "The Light's Dawn Capital has been destroyed."
    set LEGEND_LIGHTDAWN.IsCapital = true

    set LEGEND_GILNEASCASTLE = Legend.create()
    set LEGEND_GILNEASCASTLE.Unit = gg_unit_h04I_0101
    set LEGEND_GILNEASCASTLE.DeathMessage = "The Gilneas castle has fallen"
    set LEGEND_GILNEASCASTLE.IsCapital = true

    set LEGEND_OBELISK2 = Legend.create()
    set LEGEND_OBELISK2.Unit = gg_unit_nico_3980
    set LEGEND_OBELISK2.IsCapital = true
  endfunction

endlibrary