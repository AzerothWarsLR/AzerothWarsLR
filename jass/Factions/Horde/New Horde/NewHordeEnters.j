library NewHordeEnters initializer OnInit requires Persons, NewHordeConfig, DetermineLevel

  private function PersonFactionChanges takes nothing returns nothing
    local unit u = null
    local player p = null
    if GetTriggerPerson().faction == FACTION_NEW_HORDE then
      call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Warchief Thrall has united the disparate races of Kalimdor into the " + GetTriggerPerson().faction.prefixCol + "New Horde!")     
      set p = GetTriggerPerson().p
      set u = CreateUnit(p, 'Ntin', -8882, -654, 151)   //Gazlowe
      call UnitDetermineLevel(u, 1.00)
      set u = CreateUnit(p, 'Orex', -9414, -2474, 56)   //Rexxar
      call UnitDetermineLevel(u, 1.00)
      set u = null
      set p = null
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call OnPersonFactionChange.register(trig)
    call TriggerAddAction(trig, function PersonFactionChanges)
  endfunction

endlibrary