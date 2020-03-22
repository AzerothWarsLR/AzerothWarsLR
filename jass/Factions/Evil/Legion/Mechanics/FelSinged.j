library FelSinged initializer OnInit requires LegionConfig

  private function FelSinge takes unit whichUnit returns nothing
    call AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Immolation\\ImmolationDamage.mdl", whichUnit, "origin")
    call SetUnitVertexColor(whichUnit, 170, 255, 170, 255)
  endfunction

  private function Trained takes nothing returns nothing
    if Persons[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))].faction == FACTION_LEGION then 
      if IsUnitType(GetTrainedUnit(), UNIT_TYPE_UNDEAD) == true and IsUnitType(GetTrainedUnit(), UNIT_TYPE_HERO) == false and IsUnitType(GetTrainedUnit(), UNIT_TYPE_GIANT) == false then
        call FelSinge(GetTrainedUnit())
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddAction(trig, function Trained)
  endfunction

endlibrary