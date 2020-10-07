library PlayerLeaves initializer OnInit requires Persons

  private function PlayerLeaves takes nothing returns nothing
    local player p = GetTriggerPlayer()
    local integer pId = GetPlayerId(p)
    local Person triggerPerson = Person.ByHandle(GetTriggerPlayer())

    if triggerPerson.Faction != 0 then
      call BJDebugMsg( triggerPerson.Faction.Name + " has left the game." )
    else
      call BJDebugMsg( GetPlayerName(p) + " has left the game." )        
    endif

    if triggerPerson != 0 then
      call triggerPerson.Faction.Leave()
      set triggerPerson.Faction = 0
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