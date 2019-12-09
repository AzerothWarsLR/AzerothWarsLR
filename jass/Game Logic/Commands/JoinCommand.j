//Joins the specified Team. Only works if an Invite has first been extended. 

library JoinCommand initializer OnInit requires Team

	globals
    private constant string COMMAND = "-join "
  endglobals

	private function Actions takes nothing returns nothing
  	local string enteredString = GetEventPlayerChatString()
    local string content = null
    local Team targetTeam = 0
    local Person triggerPerson = Persons[GetPlayerId(GetTriggerPlayer())]
  
  	if SubString( enteredString, 0, StringLength(COMMAND) ) == COMMAND then
    	set content = SubString(enteredString, StringLength(COMMAND), StringLength(enteredString))
      set content = StringCase(content, false)
      set targetTeam = Team.teamsByName[content]
      if targetTeam != 0 then
        if IsPlayerInForce(triggerPerson.p, targetTeam.invitees) then
          call targetTeam.addPlayer(triggerPerson.p)
        else
          call DisplayTextToPlayer(triggerPerson.p, 0, 0, "You have not been invited to join " + targetTeam.name + ".")
        endif
      else
        call DisplayTextToPlayer(triggerPerson.p, 0, 0, "There is no Team with the name " + targetTeam.name + ".")
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