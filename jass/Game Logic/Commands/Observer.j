library ObserverCommand initializer OnInit

  //**CONFIG
  globals
      private constant string COMMAND     = "-obs"
  endglobals
  //*ENDCONFIG
  
  private function Actions takes nothing returns nothing
    local Person triggerPerson = Persons[GetPlayerId(GetTriggerPlayer())]
    local group tempGroup = CreateGroup()

    call ForceAddPlayer(Observers, GetTriggerPlayer())
    call SetPlayerState(GetTriggerPlayer(), PLAYER_STATE_OBSERVER, 1)
    call CreateFogModifierRectBJ( true, GetTriggerPlayer(), FOG_OF_WAR_VISIBLE, GetPlayableMapRect() )

    if triggerPerson.getFaction() != 0 then
      call BJDebugMsg( triggerPerson.getFaction().getName() + " has become an observer." )
    else
      call BJDebugMsg( GetPlayerName(triggerPerson.getPlayer()) + " has become an observer." )        
    endif        

    if triggerPerson != 0 then         
      call triggerPerson.leave()
      call triggerPerson.setFaction(-1)
      call triggerPerson.setTeam(-1)
      call triggerPerson.destroy()
    endif
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