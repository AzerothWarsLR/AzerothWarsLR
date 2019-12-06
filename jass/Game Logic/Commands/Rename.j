library Rename initializer OnInit requires Persons

    //**CONFIG
    globals
        private constant string COMMAND     = "-name "
    endglobals
    //*ENDCONFIG
    
    private function Actions takes nothing returns nothing
        local integer i = 0
        local string enteredString = GetEventPlayerChatString()
        local string content = null
        local Person triggerPerson = Persons[GetPlayerId(GetTriggerPlayer())]
        
        set content = SubString(enteredString, StringLength(COMMAND), StringLength(enteredString))  
        call triggerPerson.setName(content)
    endfunction

    private function OnInit takes nothing returns nothing
        local trigger trig = CreateTrigger(  )
        local integer i = 0
        
        loop
        exitwhen i > MAX_PLAYERS
            call TriggerRegisterPlayerChatEvent( trig, Player(i), COMMAND, false )
            set i = i + 1
        endloop   
        
        call TriggerAddCondition( trig, Condition(function Actions) )
    endfunction
    
endlibrary
