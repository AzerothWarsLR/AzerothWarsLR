
library CheatShores initializer OnInit requires Shore, TestSafety

  //**CONFIG
  globals
    private constant string COMMAND     = "-shores"
  endglobals
  //*ENDCONFIG

  private function Actions takes nothing returns nothing
    local integer i = 0
    loop
      exitwhen i == Shore.Count
      if GetLocalPlayer() == GetTriggerPlayer() then
        call PingMinimap(Shore.ByIndex(i).x, Shore.ByIndex(i).y, 10)
      endif
      set i = i + 1
    endloop
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local integer i = 0
    if AreCheatsActive == true then
      loop
      exitwhen i > MAX_PLAYERS
        call TriggerRegisterPlayerChatEvent( trig, Player(i), COMMAND, true )
        set i = i + 1
      endloop   
      call TriggerAddAction( trig, function Actions )
    endif
  endfunction
    
endlibrary