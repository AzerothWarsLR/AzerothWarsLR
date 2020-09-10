//Moves a Stormwind hero to Stromgarde and expects the Stromgarde quest to be completed.

library TestStromgarde requires Test, StormwindConfig, LegendStormwind

  struct TestStromgarde extends Test
    private method Run takes nothing returns nothing
      local unit testUnit = CreateUnit(FACTION_STORMWIND.Player, 'Hpal', 0, 0, 0)
      call SetUnitPosition(testUnit, GetRectCenterX(gg_rct_Stromgarde), GetRectCenterY(gg_rct_Stromgarde))
      call RemoveUnit(testUnit)
      call this.Assert(GetOwningPlayer(gg_unit_H00Z_1936) == FACTION_STORMWIND.Player, "Expected Danath Trollbane to be owned by Stormwind player")
    endmethod

    private static method onInit takes nothing returns nothing
      call thistype.create("stromgarde")
    endmethod
  endstruct

endlibrary