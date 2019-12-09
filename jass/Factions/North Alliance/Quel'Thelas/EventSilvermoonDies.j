library EventSilvermoonDies initializer OnInit requires Persons, Faction

  private function Actions takes nothing returns nothing
    local Person quelthalas = PersonsByFaction[FACTION_QUELTHELAS]
    if quelthalas != 0 then        //Quel'thalas
      call quelthalas.applyFactionMod(25)
      call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "The grand city of the high elves, Silvermoon, has been crushed by her enemies. The Sunwell still remains; without it, the High Elves will be powerless.")  
    endif
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function Dies takes nothing returns nothing
    if GetUnitTypeId(GetTriggerUnit()) == 'h003' then
      call Actions()
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition(trig, Condition(function Dies))       
  endfunction    

endlibrary