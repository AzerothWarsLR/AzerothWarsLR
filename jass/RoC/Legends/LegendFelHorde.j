library LegendFelHorde initializer OnInit requires Legend

  globals
    Legend LEGEND_MAGTHERIDON
    Legend LEGEND_ZULUHED
    
    Legend LEGEND_BLACKROCKSPIRE
    Legend LEGEND_BLACKTEMPLE
    Legend LEGEND_HELLFIRECITADEL
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_MAGTHERIDON = Legend.create()
    set LEGEND_MAGTHERIDON.Unit = gg_unit_Nmag_0893
    call LEGEND_MAGTHERIDON.AddUnitDependency(gg_unit_o00F_0659)
    set LEGEND_MAGTHERIDON.DeathMessage = "Magtheridon’s eternal demon soul has been consumed, and his life permanently extinguished. The Lord of Outland has fallen."
  
    set LEGEND_ZULUHED = Legend.create()
    set LEGEND_ZULUHED.UnitType = 'O00Y'
    set LEGEND_ZULUHED.StartingXP = 10800

    set LEGEND_BLACKROCKSPIRE = Legend.create()
    set LEGEND_BLACKROCKSPIRE.Unit = gg_unit_o013_2507
    set LEGEND_BLACKROCKSPIRE.DeathMessage = "Blackrock Spire has been razed."
    set LEGEND_BLACKROCKSPIRE.IsCapital = true

    set LEGEND_BLACKTEMPLE = Legend.create()
    set LEGEND_BLACKTEMPLE.Unit = gg_unit_o00F_0659
    set LEGEND_BLACKTEMPLE.IsCapital = true
    
    set LEGEND_HELLFIRECITADEL = Legend.create()
    set LEGEND_HELLFIRECITADEL.Unit = gg_unit_o008_0168
  endfunction

endlibrary