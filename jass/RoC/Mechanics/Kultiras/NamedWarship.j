library NamedWarship initializer OnInit requires SpellHelpers

  globals
    private constant integer UNITTYPE_ID = 'h04J'
    private integer count = 0
  endglobals

  private function OutfitShip takes unit whichUnit returns nothing
    if count == 0 then
      call BlzSetUnitName(whichUnit, "The Abyssal Melody")
      call BlzSetUnitArmor(whichUnit, BlzGetUnitArmor(whichUnit) + 4)
    elseif count == 1 then
      call BlzSetUnitName(whichUnit, "The Siren's Daughter")
      call BlzSetUnitMaxHP(whichUnit, BlzGetUnitMaxHP(whichUnit) + 200)
      call SetUnitLifePercentBJ(whichUnit, 100.)
    elseif count == 2 then
      call BlzSetUnitName(whichUnit, "The Valorous Rose")
      call BlzSetUnitAttackCooldown(whichUnit, BlzGetUnitAttackCooldown(whichUnit, 0) * 0.8, 0)
    elseif count == 3 then
      call BlzSetUnitName(whichUnit, "Proudmoore Flagship")
      call BlzSetUnitBaseDamage(whichUnit, BlzGetUnitBaseDamage(whichUnit, 0) + 40, 0)
    elseif count == 4 then
      call BlzSetUnitName(whichUnit, "The Stormy Pearl")
      call BlzSetUnitBaseDamage(whichUnit, BlzGetUnitBaseDamage(whichUnit, 0) + 20, 0)
      call BlzSetUnitMaxHP(whichUnit, BlzGetUnitMaxHP(whichUnit) + 100)
      call SetUnitLifePercentBJ(whichUnit, 100.)
    endif
    set count = count + 1
    if count > 4 then
      set count = 0
    endif
  endfunction

  private function OnAnyUnitConstruct takes nothing returns nothing
    if GetUnitTypeId(GetTrainedUnit()) == UNITTYPE_ID then
      call OutfitShip(GetTrainedUnit())
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddAction(trig, function OnAnyUnitConstruct)
  endfunction

endlibrary