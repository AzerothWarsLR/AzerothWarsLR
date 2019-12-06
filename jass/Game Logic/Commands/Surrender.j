library Surrender initializer OnInit

    //**CONFIG
    globals
        private constant string COMMAND     = "-surrender"
    endglobals
    //*ENDCONFIG
    
    private function Actions takes nothing returns nothing
        local Person triggerPerson = Persons[GetPlayerId(GetTriggerPlayer())]
        local group tempGroup = CreateGroup()

        call DisplayTextToForce ( bj_FORCE_ALL_PLAYERS, triggerPerson.getFaction().getName() + " has surrendered.")   
        call triggerPerson.leave()
        call triggerPerson.setFaction(-1)
        call triggerPerson.setTeam(-1)
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