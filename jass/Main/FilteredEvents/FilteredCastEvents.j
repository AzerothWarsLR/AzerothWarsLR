library FilteredCastEvents initializer OnInit requires PlayerUnitEventFilterManager

  globals
    private FilteredEventType FILTEREDEVENTTYPE_SPELLFINISHED
  endglobals

  function RegisterSpellFinishedEvent takes code whichTriggerAction, integer spellId returns nothing
    call PlayerUnitEventAddFilteredAction(EVENT_PLAYER_UNIT_SPELL_FINISH, whichTriggerAction, FILTEREDEVENTTYPE_SPELLFINISHED, spellId)
  endfunction

  private function OnAnyUnitSpellFinished takes nothing returns nothing
    call PlayerUnitEventExecute(EVENT_PLAYER_UNIT_SPELL_FINISH, FILTEREDEVENTTYPE_SPELLFINISHED, GetSpellAbilityId())
  endfunction

  private function OnInit takes nothing returns nothing
    call PlayerUnitEventAddAction(EVENT_PLAYER_UNIT_ATTACKED, function OnAnyUnitSpellFinished)
    set FILTEREDEVENTTYPE_SPELLFINISHED = FilteredEventType.create()
  endfunction

endlibrary