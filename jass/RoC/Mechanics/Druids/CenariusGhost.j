library CenariusGhost initializer OnInit requires LegendDruids

  private function Dies takes nothing returns nothing
    if LEGEND_CENARIUS == GetTriggerLegend() and GetTriggerLegend().UnitType == UNITTYPE_CENARIUS_ALIVE then
      set LEGEND_CENARIUS.UnitType = UNITTYPE_CENARIUS_GHOST
      set LEGEND_CENARIUS.PermaDies = false
      call LEGEND_CENARIUS.ClearUnitDependencies()
      call LEGEND_CENARIUS.Spawn(FACTION_DRUIDS.Player, GetRectCenterX(gg_rct_Cenarius), GetRectCenterY(gg_rct_Cenarius), 270)
      call DestroyTrigger(GetTriggeringTrigger())         
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnLegendPermaDeath.register(trig)
    call TriggerAddCondition(trig, Condition(function Dies))        
    set LEGEND_CENARIUS.DeathMessage = "塞纳留斯，暗夜精灵的半神已经倒下。他的灵魂活了下来，但却只不过是从前的回音。"
  endfunction  

endlibrary