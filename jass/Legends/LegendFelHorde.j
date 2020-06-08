library LegendFelHorde initializer OnInit requires Legend

  globals
    Legend LEGEND_MAGTHERIDON
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_MAGTHERIDON = Legend.create()
    set LEGEND_MAGTHERIDON.Unit = gg_unit_Nmag_0893
    call LEGEND_MAGTHERIDON.AddUnitDependency(gg_unit_o00F_0659)
    set LEGEND_MAGTHERIDON.DeathMessage = "Magtheridon’s eternal demon soul has been consumed, and his life permanently extinguished. The Lord of Outland has fallen."
  endfunction

endlibrary