library CenariusGhost initializer OnInit requires LegendDruids

  private function Dies takes nothing returns nothing
    if LEGEND_CENARIUS == GetTriggerLegend() and GetUnitTypeId(GetTriggerLegend().Unit) == UNITTYPE_CENARIUS_ALIVE then
      set LEGEND_CENARIUS.UnitType = UNITTYPE_CENARIUS_GHOST
      set LEGEND_CENARIUS.PermaDies = false
      call LEGEND_CENARIUS.ClearUnitDependencies()
      call ReviveHero(LEGEND_CENARIUS.Unit, GetUnitX(LEGEND_CENARIUS.Unit), GetUnitY(LEGEND_CENARIUS.Unit), false)
      call DestroyTrigger(GetTriggeringTrigger())         
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnLegendPermaDeath.register(trig)
    call TriggerAddCondition(trig, Condition(function Dies))            
  endfunction  

endlibrary