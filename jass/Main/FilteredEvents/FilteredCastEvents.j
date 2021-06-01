library FilteredCastEvents initializer OnInit requires PlayerUnitEventFilterManager

  globals
    private FilteredEventType FILTEREDEVENTTYPE_SPELLEFFECT
  endglobals

  function RegisterSpellEffectAction takes integer spellId, code whichTriggerAction returns nothing
    call PlayerUnitEventAddFilteredAction(EVENT_PLAYER_UNIT_SPELL_EFFECT, whichTriggerAction, FILTEREDEVENTTYPE_SPELLEFFECT, spellId)
  endfunction

  private function OnAnyUnitSpellFinished takes nothing returns nothing
    call PlayerUnitEventExecute(EVENT_PLAYER_UNIT_SPELL_EFFECT, FILTEREDEVENTTYPE_SPELLEFFECT, GetSpellAbilityId())
  endfunction

  private function OnInit takes nothing returns nothing
    call PlayerUnitEventAddAction(EVENT_PLAYER_UNIT_SPELL_EFFECT, function OnAnyUnitSpellFinished)
    set FILTEREDEVENTTYPE_SPELLEFFECT = FilteredEventType.create()
  endfunction

endlibrary