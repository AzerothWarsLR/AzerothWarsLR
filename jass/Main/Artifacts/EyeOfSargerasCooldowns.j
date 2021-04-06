library EyeOfSargerasCooldowns initializer OnInit requires Artifact, SpellHelpers

  globals
    private constant integer SPELL_A = 'A04G'
    private constant integer SPELL_B = 'ACrg'
    private constant integer SPELL_C = 'ACde'
    private constant integer SPELL_D = 'A04B'
  endglobals

  private function ItemPickup takes nothing returns nothing
    local unit triggerUnit
    if GetManipulatedItem() == ARTIFACT_EYEOFSARGERAS.item then
      set triggerUnit = GetTriggerUnit()
      call StartUnitAbilityCooldownFull(triggerUnit, SPELL_A)
      call StartUnitAbilityCooldownFull(triggerUnit, SPELL_B)
      call StartUnitAbilityCooldownFull(triggerUnit, SPELL_C)
      call StartUnitAbilityCooldownFull(triggerUnit, SPELL_D)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_PICKUP_ITEM)
    call TriggerAddAction(trig, function ItemPickup)
  endfunction

endlibrary