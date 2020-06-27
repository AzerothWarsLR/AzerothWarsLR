library LegendLordaeron initializer OnInit requires Legend

  globals
    Legend LEGEND_UTHER
    Legend LEGEND_ARTHAS
    Legend LEGEND_MOGRAINE
    Legend LEGEND_GARITHOS

    Legend LEGEND_CAPITALPALACE
    Legend LEGEND_STRATHOLME
    Legend LEGEND_TYRSHAND
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_UTHER = Legend.create()
    set LEGEND_UTHER.Unit = gg_unit_Huth_1343
    call LEGEND_UTHER.AddUnitDependency(gg_unit_h000_0406)
    set LEGEND_UTHER.DeathMessage = "Uther the Lightbringer makes his last stand, perishing in the defense of the light. Lordaeron, and humanity itself, has lost one of its finest exemplars in this dark hour."
  
    set LEGEND_ARTHAS = Legend.create()
    set LEGEND_ARTHAS.Unit = gg_unit_Hart_1342

    set LEGEND_MOGRAINE = Legend.create()
    set LEGEND_MOGRAINE.UnitType = 'H01J'

    set LEGEND_GARITHOS = Legend.create()
    set LEGEND_GARITHOS.UnitType = 'Hlgr'

    set LEGEND_CAPITALPALACE = Legend.create()
    set LEGEND_CAPITALPALACE.Unit = gg_unit_h000_0406
    set LEGEND_CAPITALPALACE.DeathMessage = "The capital city of Lordaeron has been razed, and King Terenas is dead."

    set LEGEND_STRATHOLME = Legend.create()
    set LEGEND_STRATHOLME.Unit = gg_unit_h01G_0885
    set LEGEND_STRATHOLME.DeathMessage = "The majestic city of Stratholme has been destroyed."

    set LEGEND_TYRSHAND = Legend.create()
    set LEGEND_TYRSHAND.Unit = gg_unit_h030_0839
    set LEGEND_TYRSHAND.DeathMessage = "Tyr's Hand, the bastion of human power in Lordaeron, has fallen."
  endfunction

endlibrary