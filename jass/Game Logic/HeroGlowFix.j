library HeroGlowFix initializer OnInit requires Legend

  private function Revived takes nothing returns nothing
    local Legend revivedLegend = Legend.ByHandle(GetTriggerUnit())
    if revivedLegend.HasCustomColor then
      call SetUnitColor(GetTriggerUnit(), revivedLegend.PlayerColor)
    else
      call SetUnitColor(GetTriggerUnit(), Person.ByHandle(GetTriggerPlayer()).Faction.playCol)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_HERO_REVIVE_FINISH  )
    call TriggerAddCondition(trig, Condition(function Revived))    
  endfunction

endlibrary