library ThunderFists initializer OnInit requires FilteredDamageEvents, DummyCast

  globals
    private constant integer UNITTYPE_ID = 'O01P'
    private constant integer ABIL_ID = 'A0LN'
    private constant integer DUMMY_ABIL_ID = 'A024'

    private constant real CHANCE = 0.35
  endglobals

  private function Damaging takes nothing returns nothing
    local integer level = GetUnitAbilityLevel(GetEventDamageSource(), ABIL_ID)
    if level > 0 and BlzGetEventIsAttack() == true and GetRandomReal(0,1) <= CHANCE then
      call DummyCastUnitFromPoint(GetOwningPlayer(GetEventDamageSource()), DUMMY_ABIL_ID, "forkedlightning", level, GetTriggerUnit(), GetUnitX(GetEventDamageSource()), GetUnitY(GetEventDamageSource()))
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    call RegisterUnitTypeInflictsDamageAction(UNITTYPE_ID, function Damaging)
  endfunction

endlibrary