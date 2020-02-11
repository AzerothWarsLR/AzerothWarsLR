library CleanPersons initializer OnInit requires Persons, TestSafety

  //Removes players from the game if their slot is unoccupied

  private function Actions takes nothing returns nothing
    local integer i = 0

    if not AreCheatsActive then
      loop
      exitwhen i > MAX_PLAYERS
        if Persons[i] != 0 and GetPlayerSlotState(Persons[i].p) != PLAYER_SLOT_STATE_PLAYING then
          call Persons[i].leave()
          call Persons[i].setFaction(0)
          call Persons[i].setTeam(0)
          call Persons[i].destroy()
        endif
        set i = i + 1
      endloop
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, 2., false)
    call TriggerAddCondition(trig, Condition(function Actions))
  endfunction

endlibrary