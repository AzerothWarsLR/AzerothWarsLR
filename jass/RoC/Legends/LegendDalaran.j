library LegendDalaran initializer OnInit requires Legend

  globals
    Legend LEGEND_ANTONIDAS
    Legend LEGEND_MEDIVH
    Legend LEGEND_JAINA

    Legend LEGEND_DALARAN
  endglobals

  private function OnInit takes nothing returns nothing 
    set LEGEND_JAINA = Legend.create()
    set LEGEND_JAINA.Unit = gg_unit_Hjai_1676

    set LEGEND_MEDIVH = Legend.create()
    set LEGEND_MEDIVH.UnitType = 'Haah'
    set LEGEND_MEDIVH.StartingXP = 5400

    set LEGEND_DALARAN = Legend.create()
    set LEGEND_DALARAN.Unit = gg_unit_h002_0230
    set LEGEND_DALARAN.DeathMessage = "The Violet Citadel, the ultimate bastion of arcane knowledge in the Eastern Kingdoms, crumbles like a sand castle."

    set LEGEND_ANTONIDAS = Legend.create()
    set LEGEND_ANTONIDAS.Unit = gg_unit_Hant_1675
    call LEGEND_ANTONIDAS.AddUnitDependency(LEGEND_DALARAN.Unit)
    set LEGEND_ANTONIDAS.DeathMessage = "Archmage Antonidas has been cut down, his vast knowledge forever lost with his death. The mages of Dalaran have lost their brightest mind."
  endfunction

endlibrary