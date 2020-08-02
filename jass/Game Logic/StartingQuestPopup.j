library StartingQuestPopup initializer OnInit requires Faction

  //Displays each Faction's starting quest after the cinematic phase ends

  private function Actions takes nothing returns nothing
    local integer i = 0
    loop
    exitwhen i > MAX_PLAYERS
      if Persons[i].Faction.StartingQuest != 0 then
        if GetLocalPlayer() == Persons[i].p then
          call Persons[i].Faction.StartingQuest.displayDiscovered()
        endif
      endif
      set i = i + 1
    endloop
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, 63., false)
    call TriggerAddCondition(trig, Condition(function Actions))
  endfunction

endlibrary