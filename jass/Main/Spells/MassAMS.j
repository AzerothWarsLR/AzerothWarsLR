library MassAMS initializer OnInit requires DummyCast

  globals
    private constant integer ABIL_ID = 'A0JM'
    private constant integer DUMMY_ABIL_ID = 'A0JN'
    private constant string DUMMY_ORDER_STRING = "antimagicshell"
    private constant real RADIUS = 200.
  endglobals

  private function BanishFilter takes unit caster, unit target returns boolean
    if IsUnitAlly(target, GetOwningPlayer(caster)) and not IsUnitType(target, UNIT_TYPE_STRUCTURE) and not IsUnitType(target, UNIT_TYPE_ANCIENT) and not IsUnitType(target, UNIT_TYPE_MECHANICAL) and IsUnitAliveBJ(target) then
      return true
    endif
    return false
  endfunction

  private function Cast takes nothing returns nothing
    if GetSpellAbilityId() == ABIL_ID then
      call DummyCastOnUnitsInCircle(GetTriggerUnit(), DUMMY_ABIL_ID, DUMMY_ORDER_STRING, GetUnitAbilityLevel(GetTriggerUnit(), ABIL_ID), GetSpellTargetX(), GetSpellTargetY(), RADIUS, CastFilter.BanishFilter)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( trig, Condition(function Cast))
  endfunction

endlibrary