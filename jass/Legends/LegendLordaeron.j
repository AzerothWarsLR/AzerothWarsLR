library LegendLordaeron initializer OnInit requires Legend

  globals
    Legend LEGEND_UTHER
    Legend LEGEND_ARTHAS
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_UTHER = Legend.create()
    set LEGEND_UTHER.Unit = gg_unit_Huth_1343
    call LEGEND_UTHER.AddUnitDependency(gg_unit_h000_0406)
    set LEGEND_UTHER.DeathMessage = "Uther the Lightbringer makes his last stand, perishing in the defense of the light. Lordaeron, and humanity itself, has lost one of its finest exemplars in this dark hour."
  
    set LEGEND_ARTHAS = Legend.create()
    set LEGEND_ARTHAS.Unit = gg_unit_Hart_1342
  endfunction

endlibrary