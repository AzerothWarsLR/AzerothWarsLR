library ObserverCommand initializer OnInit

  //**CONFIG
  globals
      private constant string COMMAND     = "-obs"
  endglobals
  //*ENDCONFIG
  
  private function Actions takes nothing returns nothing
    local Person triggerPerson = Person.ByHandle(GetTriggerPlayer())
    local group tempGroup = CreateGroup()

    call ForceAddPlayer(Observers, GetTriggerPlayer())
    call SetPlayerState(GetTriggerPlayer(), PLAYER_STATE_OBSERVER, 1)
    call CreateFogModifierRectBJ( true, GetTriggerPlayer(), FOG_OF_WAR_VISIBLE, GetPlayableMapRect() )

    if triggerPerson.Faction != 0 then
      call BJDebugMsg( triggerPerson.Faction.Name + " has become an observer." )
    else
      call BJDebugMsg( GetPlayerName(triggerPerson.Player) + " has become an observer." )        
    endif        

    if triggerPerson != 0 then         
      call triggerPerson.Faction.Leave()
      set triggerPerson.Faction = 0
      set triggerPerson.Faction.Team = 0
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