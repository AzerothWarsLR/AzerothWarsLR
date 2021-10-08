library OilSetup initializer OnInit requires UnitWithOil, UnitConsumesOilType

  private function OnInit takes nothing returns nothing
    call UnitConsumesOilType.create('n062', 1.00)
    call UnitConsumesOilType.create('h08Z', 5.00)

    set UnitWithOil.CentralReservoir = GetUnitIndex(gg_unit_o04V_0102)
  endfunction

endlibrary