library GrantStoredExperienceToTrainedHeroes initializer OnInit requires Faction, Legend

  private function OnAnyUnitTrained takes nothing returns nothing
    local Faction triggerFaction
    local Legend trainedLegend
    local integer expToMax
    local integer expToAward
    if IsHeroUnitId(GetUnitTypeId(GetTrainedUnit())) then
      set triggerFaction = Faction.ByHandle(GetTriggerPlayer())
      set trainedLegend = Legend.ByHandle(GetTrainedUnit())
      if triggerFaction != 0 and trainedLegend != 0 then
        set expToMax = 41800 - GetHeroXP(trainedLegend.Unit)
        set expToAward = IMinBJ(expToMax, triggerFaction.StoredExperience)
        call AddHeroXP(trainedLegend.Unit, expToAward, true)
        set triggerFaction.StoredExperience = triggerFaction.StoredExperience - expToAward
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    call PlayerUnitEventAddAction(EVENT_PLAYER_UNIT_TRAIN_FINISH, function OnAnyUnitTrained) //TODO: use filtered events
  endfunction

endlibrary