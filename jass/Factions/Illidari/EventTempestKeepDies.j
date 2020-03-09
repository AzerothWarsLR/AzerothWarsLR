library EventTempestKeepDies initializer OnInit requires Faction, IllidariConfig

  private function Dies takes nothing returns nothing
    local Person triggerPerson = Persons[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]
    if triggerPerson.faction == FACTION_ILLIDARI then
      call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Tempest Keep has fallen. The " + triggerPerson.faction.prefixCol + triggerPerson.faction.name + "|r forces have been decimated.")
      call triggerPerson.obliterate()
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_n05X_2874, EVENT_UNIT_DEATH )
    call TriggerAddAction( trig, function Dies )
  endfunction

endlibrary