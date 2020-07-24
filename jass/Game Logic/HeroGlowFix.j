library HeroGlowFix initializer OnInit requires Legend

  private function Revived takes nothing returns nothing
    local Legend revivedLegend = Legend.fromHandle(GetTriggerUnit())
    if revivedLegend.PlayerColor != null then
      call SetUnitColor(GetTriggerUnit(), revivedLegend.PlayerColor)
    else
      call SetUnitColor(GetTriggerUnit(), Persons[GetPlayerId(GetTriggerPlayer())].Faction.playCol)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_HERO_REVIVE_FINISH  )
    call TriggerAddCondition(trig, Condition(function Revived))    
  endfunction

endlibrary