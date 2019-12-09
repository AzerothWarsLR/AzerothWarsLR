//A command that causes a player to leave their Team and be given a solo Team with their Faction as the name. 

library Unally initializer OnInit requires Team, Persons, Faction

	globals
    private constant string COMMAND = "-unally"
  endglobals

	private function Actions takes nothing returns nothing
    local Person triggerPerson = Persons[GetPlayerId(GetTriggerPlayer())]
    local Team newTeam = 0

    if triggerPerson.team.size > 1 then
      set newTeam = Team.teamsByName[triggerPerson.faction.name]
      if newTeam == 0 then
        set newTeam = Team.create(triggerPerson.faction.name, triggerPerson.faction.icon)
      endif
      call triggerPerson.setTeam(newTeam)
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
    
    call TriggerAddAction(trig, function Actions)
 	endfunction

endlibrary