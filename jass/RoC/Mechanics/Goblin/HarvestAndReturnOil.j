library HarvestAndReturnOil initializer OnInit requires UnitWithOil, FilteredCastEvents

  globals
    private constant integer RETURN_SPELL = 'A0OA'
    private constant integer HARVEST_SPELL = 'A0O8'

    private constant string RETURN_ORDER = "charm"
    private constant string HARVEST_ORDER = "charm"
  endglobals

  private function Harvest takes nothing returns nothing
    local unit targetUnit = GetSpellTargetUnit()
    local unit triggerUnit = GetTriggerUnit()
    local UnitWithOil triggerUnitWithOil = GetUnitIndex(triggerUnit)
    local UnitWithOil targetUnitWithOil = GetUnitIndex(targetUnit)

    if triggerUnitWithOil.Exists == false then
      call BJDebugMsg("ERROR: caster is not an oil carrier")        
      return
    endif

    if targetUnitWithOil.Exists == false then  
      call BJDebugMsg("ERROR: target is not an oil carrier")
      return
    endif

    //Need to record the oil source so that the harvester can return to it after delivering their oil back home
    set triggerUnitWithOil.LastHarvestedSource = targetUnitWithOil

    //Remove harvest ability, add return ability, and issue return order
    call UnitRemoveAbilityBJ(HARVEST_SPELL, triggerUnit )
    call UnitAddAbilityBJ(RETURN_SPELL, triggerUnit )
    call targetUnitWithOil.Transfer(triggerUnitWithOil, 20)
    call IssueTargetOrder(triggerUnit, RETURN_ORDER, UnitWithOil.CentralReservoir.unit) //ERORR HERE
    call BJDebugMsg(R2S(triggerUnitWithOil.OilCount))
    call BJDebugMsg(R2S(targetUnitWithOil.OilCount))
  endfunction

  private function Return takes nothing returns nothing
    local unit targetUnit = GetSpellTargetUnit()
    local unit triggerUnit = GetTriggerUnit()
    local UnitWithOil triggerUnitWithOil = GetUnitIndex(triggerUnit)
    local UnitWithOil targetUnitWithOil = GetUnitIndex(targetUnit)

    call triggerUnitWithOil.Transfer(targetUnitWithOil, 20)

    //Remove harvest ability, add return ability, and issue order to harvest the last oil deposit
    call UnitAddAbilityBJ(HARVEST_SPELL, triggerUnit )
    call UnitRemoveAbilityBJ(RETURN_SPELL, triggerUnit )
    if UnitAlive(triggerUnitWithOil.LastHarvestedSource.unit) then
      call IssueTargetOrder(triggerUnit, HARVEST_ORDER, triggerUnitWithOil.LastHarvestedSource.unit)
    endif
    call BJDebugMsg(R2S(triggerUnitWithOil.OilCount))
    call BJDebugMsg(R2S(targetUnitWithOil.OilCount))
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterSpellEffectAction(RETURN_SPELL, function Return)
    call RegisterSpellEffectAction(HARVEST_SPELL, function Harvest)
  endfunction

endlibrary