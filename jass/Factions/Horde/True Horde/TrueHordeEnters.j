library TrueHordeEnters initializer OnInit requires Persons, TrueHordeConfig

  private function PersonFactionChanges takes nothing returns nothing
    local unit u = null
    local player p = null
    if GetTriggerPerson().faction == FACTION_TRUE_HORDE then
      call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Hellscream has siezed control of the Orcish clans and formed the " + GetTriggerPerson().faction.prefixCol + "True Horde|r!")     
      set p = GetTriggerPerson().p
      set u = CreateUnit(p, 'Obla', -8882, -654, 151)   //Varok Saurfang
      call UnitDetermineLevel(u, 1.00)
      set u = CreateUnit(p, 'O00X', -9314, 92, 301)   //Drek'thar
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