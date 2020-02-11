library PlayerLeaves initializer OnInit requires Persons

  private function PlayerLeaves takes nothing returns nothing
    local player p = GetTriggerPlayer()
    local integer pId = GetPlayerId(p)

    if Persons[pId].faction != 0 then
      call BJDebugMsg( Persons[pId].faction.name + " has left the game." )
    else
      call BJDebugMsg( GetPlayerName(p) + " has left the game." )        
    endif

    if Persons[pId] != 0 then
      call Persons[pId].leave()
      call Persons[pId].setFaction(0)
      call Persons[pId].setTeam(0)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local integer i = 0
    loop
    exitwhen i > 24
      call TriggerRegisterPlayerEvent(trig, Player(i), EVENT_PLAYER_LEAVE)
      set i = i + 1
    endloop
    call TriggerAddCondition( trig, Condition(function PlayerLeaves) )    
  endfunction

endlibrary