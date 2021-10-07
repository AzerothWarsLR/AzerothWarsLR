library HarvestAndReturnOil initializer OnInit requires UnitWithOil, FilteredCastEvents

    globals
        private constant integer RETURN_SPELL = 'A0OA'
        private constant integer HARVEST_SPELL = 'A0O8'
    endglobals

  private function Harvest takes nothing returns nothing
    local unit targetUnit = GetSpellTargetUnit()
    local unit triggerUnit = GetTriggerUnit()
    local UnitWithOil triggerUnitWithOil = GetUnitIndex(triggerUnit)
    local UnitWithOil targetUnitWithOil = GetUnitIndex(targetUnit)
    
    call BJDebugMsg(I2S(triggerUnitWithOil))
    call BJDebugMsg(I2S(targetUnitWithOil))

    if triggerUnitWithOil.Exists == false then
      call BJDebugMsg("ERROR: caster is not an oil carrier")        
      return
    endif

    if targetUnitWithOil.Exists == false then  
      call BJDebugMsg("ERROR: target is not an oil carrier")
      return
    endif
    call UnitRemoveAbilityBJ(HARVEST_SPELL, triggerUnit )
    call UnitAddAbilityBJ(RETURN_SPELL, triggerUnit )
    call targetUnitWithOil.Transfer(triggerUnitWithOil, 20)
    call BJDebugMsg(I2S(triggerUnitWithOil.OilCount))
    call BJDebugMsg(I2S(targetUnitWithOil.OilCount))
  endfunction

  private function Return takes nothing returns nothing
    local unit targetUnit = GetSpellTargetUnit()
    local unit triggerUnit = GetTriggerUnit()
    local UnitWithOil triggerUnitWithOil = GetUnitIndex(triggerUnit)
    local UnitWithOil targetUnitWithOil = GetUnitIndex(targetUnit)

    call triggerUnitWithOil.Transfer(targetUnitWithOil, 20)
    call UnitAddAbilityBJ(HARVEST_SPELL, triggerUnit )
    call UnitRemoveAbilityBJ(RETURN_SPELL, triggerUnit )
    call BJDebugMsg(I2S(triggerUnitWithOil.OilCount))
    call BJDebugMsg(I2S(targetUnitWithOil.OilCount))
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterSpellEffectAction(RETURN_SPELL, function Return)
    call RegisterSpellEffectAction(HARVEST_SPELL, function Harvest)
  endfunction

endlibrary