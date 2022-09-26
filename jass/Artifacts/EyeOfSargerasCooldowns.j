library EyeOfSargerasCooldowns initializer OnInit requires Artifact, SpellHelpers, ArtifactSetup, FilteredItemEvents

  globals
    private constant integer SPELL_A = 'A04G'
    private constant integer SPELL_B = 'ACrg'
    private constant integer SPELL_C = 'ACde'
    private constant integer SPELL_D = 'A04B'
  endglobals

  private function ItemPickup takes nothing returns nothing
    local unit triggerUnit = GetTriggerUnit()
    call StartUnitAbilityCooldownFull(triggerUnit, SPELL_A)
    call StartUnitAbilityCooldownFull(triggerUnit, SPELL_B)
    call StartUnitAbilityCooldownFull(triggerUnit, SPELL_C)
    call StartUnitAbilityCooldownFull(triggerUnit, SPELL_D)
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterItemTypePickupAction('I003', function ItemPickup)
  endfunction

endlibrary