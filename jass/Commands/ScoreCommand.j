library ScoreCommand initializer OnInit requires Score

  globals
    private constant string COMMAND = "-elo "
  endglobals

  private function Actions takes nothing returns nothing
    local string enteredString = GetEventPlayerChatString()
    local string content = SubString(enteredString, StringLength(COMMAND), StringLength(enteredString))
    call Score.ByFileName(content).Display()
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local integer i = 0
    
    loop
    exitwhen i > MAX_PLAYERS
      call TriggerRegisterPlayerChatEvent( trig, Player(i), COMMAND, false )
      set i = i + 1
    endloop   
    
    call TriggerAddCondition( trig, Condition(function Actions) )
  endfunction

endlibrary