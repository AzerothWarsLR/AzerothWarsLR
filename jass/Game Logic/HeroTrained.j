//When a hero is trained, give it an appropriate level.
library HeroTrained initializer OnInit requires DetermineLevel

  private function OnUnitTrained takes nothing returns nothing
    if IsUnitType(GetTrainedUnit(), UNIT_TYPE_HERO) then
      call UnitDetermineLevel(GetTrainedUnit(), 1.00)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_TRAIN_FINISH )
    call TriggerAddCondition(trig,Condition(function OnUnitTrained))
  endfunction

endlibrary