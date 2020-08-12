//Grants shared control to the target faction.

library ShareCommand initializer OnInit requires Faction

  globals
    private constant string COMMAND = "-share "
  endglobals

  private function Actions takes nothing returns nothing
    local string enteredString = GetEventPlayerChatString()
    local string content = SubString(enteredString, StringLength(COMMAND), StringLength(enteredString))
    local player triggerPlayer = GetTriggerPlayer()
    local player targetPlayer = Faction.ByName(content).Person.Player

    if IsPlayerAlly(triggerPlayer, targetPlayer) then
      call SetPlayerAlliance(triggerPlayer, targetPlayer, ALLIANCE_SHARED_CONTROL, true)
      call SetPlayerAlliance(triggerPlayer, targetPlayer, ALLIANCE_SHARED_ADVANCED_CONTROL, true)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local integer i = 0
        
    loop
    exitwhen i > MAX_PLAYERS
    	call TriggerRegisterPlayerChatEvent( trig, Player(i), COMMAND, false )
      set i = i + 1
    endloop
    
    call TriggerAddAction(trig, function Actions)
  endfunction

endlibrary