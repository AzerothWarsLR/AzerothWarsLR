library BombingRun initializer OnInit requires DummyCast

  globals
    private constant integer ABIL_ID = 'A0S5'
    private constant integer LOCUSTSWARM_ID = 'A0S1'
  endglobals

  private function Cast takes nothing returns nothing
    if GetSpellAbilityId() == ABIL_ID then
      call DummyChannelInstantFromPoint(GetOwningPlayer(GetTriggerUnit()), LOCUSTSWARM_ID, "locustswarm", 1, GetSpellTargetX(), GetSpellTargetY(), 15)
		endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( trig, Condition(function Cast))
  endfunction 

endlibrary