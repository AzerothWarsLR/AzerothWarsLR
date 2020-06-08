//Revokes an invitation sent to a player from the sending player's Team.

library UninviteCommand initializer OnInit requires Team

	globals
    private constant string COMMAND = "-uninvite "
  endglobals

	private function Actions takes nothing returns nothing
  	local string enteredString = GetEventPlayerChatString()
    local string content = null
    local Faction targetFaction = 0
    local Person targetPerson = 0	
    local Person senderPerson = Persons[GetPlayerId(GetTriggerPlayer())]
  
  	if SubString( enteredString, 0, StringLength(COMMAND) ) == COMMAND then
    	set content = SubString(enteredString, StringLength(COMMAND), StringLength(enteredString))
      set content = StringCase(content, false)
      set targetFaction = Faction.factionsByName[content]
      if targetFaction != 0 then
      	set targetPerson = PersonsByFaction[targetFaction]
        if targetPerson != 0 then
        	call senderPerson.team.uninvite(targetPerson.p)
        else
          call DisplayTextToPlayer(senderPerson.p, 0, 0, "There is no player with the Faction " + targetFaction.prefixCol + targetFaction.name + "|r.")
      	endif
      else
        call DisplayTextToPlayer(senderPerson.p, 0, 0, "There is no Faction with the name " + content + ".")
      endif
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