//A command for a player to ally another player according to their Faction. 

/* library AllyCommand initializer OnInit requires Team, Persons, Faction

	globals
    private constant string COMMAND = "-ally "
    private constant real REQUEST_DURATION = 30.

    private Person array  targetOfRequest           //Indexed by person
    private boolean array requestSent               //Indexed by person - linked to above
  endglobals

	private function SendAlliance takes Person senderPerson, Person targetPerson returns nothing
    local string senderName = senderPerson.faction.prefixCol + senderPerson.faction.name + "|r"
    local string targetName = targetPerson.faction.prefixCol + targetPerson.faction.name + "|r"
    //We don't want to be able to send a request if the sender has already sent a request
    if requestSent[senderPerson] == false then
      set requestSent[senderPerson] = true
      set targetOfRequest[senderPerson] = targetPerson
      call DisplayTimedTextToPlayer(targetPerson.p, 0, 0, REQUEST_DURATION, senderName + " has invited you to his team, type: -ally " + senderName + " to accept. You can also type -decline to prevent further demands from that player.")
      call DisplayTextToPlayer(senderPerson.p, 0, 0, "You have sent an alliance invitation to " + targetName + ".")
      call TriggerSleepAction(REQUEST_DURATION)
      set requestSent[senderPerson] = false
      set targetOfRequest[senderPerson] = 0
    endif
  endfunction

	private function Actions takes nothing returns nothing
  	local string enteredString = GetEventPlayerChatString()
    local string content = null
    local Faction targetFaction = 0
    local Person targetPerson = 0	
    local Person senderPerson = Persons[GetPlayerId(GetTriggerPlayer())]
  
  	//Check if the entered command is at the very start
  	if SubString( enteredString, 0, StringLength(COMMAND) ) == COMMAND then
    	set content = SubString(enteredString, StringLength(COMMAND), StringLength(enteredString))
      set content = StringCase(content, false)
      set targetFaction = Faction.factionsByName[content]
      if targetFaction != 0 then
      	set targetPerson = PersonsByFaction[targetFaction.id]
        if targetPerson != 0 then
        	call SendAlliance(senderPerson, targetPerson)
      	endif
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

endlibrary */