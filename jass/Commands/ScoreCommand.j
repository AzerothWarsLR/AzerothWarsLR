library ScoreCommand initializer OnInit requires Score

  globals
    private constant string COMMAND = "-elo"
  endglobals

  private function Actions takes nothing returns nothing
    local Score score = Score.first
    loop
      exitwhen score == 0
      if GetLocalPlayer() == GetTriggerPlayer() then
        call score.Display()
      endif
      set score = score.next
    endloop
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local integer i = 0
    
    loop
    exitwhen i > MAX_PLAYERS
      call TriggerRegisterPlayerChatEvent( trig, Player(i), COMMAND, true )
      set i = i + 1
    endloop   
    
    call TriggerAddCondition( trig, Condition(function Actions) )
  endfunction

endlibrary