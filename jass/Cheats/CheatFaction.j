library CheatFaction initializer OnInit requires Faction, TestSafety

  globals
    private constant string COMMAND = "-faction "
    private string parameter = null
  endglobals

  private function Actions takes nothing returns nothing
    local integer i = 0
    local string enteredString = GetEventPlayerChatString()
    local player p = GetTriggerPlayer()
    local integer pId = GetPlayerId(p)
    local Faction f
    set parameter = SubString(enteredString, StringLength(COMMAND), StringLength(enteredString))  
    set f = Faction.factionsByName[parameter]
    
    call Persons[pId].setFaction(f)
    call DisplayTextToPlayer(p, 0, 0, "|cffD27575CHEAT:|r Attempted to set faction to " + f.name + ".")
  endfunction

  //===========================================================================
  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local integer i = 0
    if AreCheatsActive == true then
      loop
      exitwhen i > MAX_PLAYERS
        call TriggerRegisterPlayerChatEvent( trig, Player(i), COMMAND, false )
        set i = i + 1
      endloop   
      call TriggerAddAction( trig, function Actions )
    endif
  endfunction

endlibrary