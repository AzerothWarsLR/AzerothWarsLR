library GameTimer initializer OnInit

  globals
    private constant real TURN_DURATION = 60.
    private constant real TIMER_DELAY = 6.      //How long after game start to actually show the timer. 
                                                //This must be after the Multiboard is shown or the Multiboard will break
    private timer GameTimer = null
    private timerdialog GameTimerDialog = null
    private integer TurnCount = 0

    private real GameTime = 0
  endglobals

  //Returns the number of seconds that have elapsed since the start of the game  
  function GetGameTime takes nothing returns real
    return GameTime
  endfunction

  private function EndTurn takes nothing returns nothing
    set TurnCount = TurnCount + 1
    call TimerDialogSetTitle(GameTimerDialog, "Turn " + I2S(TurnCount))
    set GameTime = GameTime + TURN_DURATION
  endfunction

  private function ShowTimer takes nothing returns nothing
    call TimerDialogDisplay(GameTimerDialog, true)
    call TimerDialogSetTitle(GameTimerDialog, "Game starts in:")    
  endfunction

  private function Actions takes nothing returns nothing
    set GameTimer = CreateTimer()
    set GameTimerDialog = CreateTimerDialog(GameTimer)
    call TimerStart(GameTimer, TURN_DURATION, true, function EndTurn)
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, 0, false)
    call TriggerAddCondition(trig, Condition(function Actions))  
    
    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, TIMER_DELAY, false)
    call TriggerAddCondition(trig, Condition(function ShowTimer))  
  endfunction

endlibrary
