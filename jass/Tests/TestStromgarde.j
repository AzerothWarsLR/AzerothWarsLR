library TestStromgarde initializer OnInit requires Test, StormwindConfig, LegendStormwind

  private function TestFunction takes nothing returns boolean
    local unit testUnit = CreateUnit(FACTION_STORMWIND.Person.p, 'Hpal', 0, 0, 0)
    call SetUnitPosition(testUnit, GetRectCenterX(gg_rct_Stromgarde), GetRectCenterY(gg_rct_Stromgarde))
    if GetOwningPlayer(gg_unit_H00Z_1936) == FACTION_STORMWIND.Person.p then
      return true
    endif
    return false
  endfunction

  private function OnInit takes nothing returns nothing
    local Test newTest = Test.create("TestStromgarde", TestFunction)
  endfunction

endlibrary