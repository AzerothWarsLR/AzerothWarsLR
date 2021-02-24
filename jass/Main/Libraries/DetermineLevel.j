//A function for giving a newly created hero a level which is appropriate for when that hero was created. 

library DetermineLevel initializer OnInit

    //*CONFIG
    globals
        private constant real XP_BASE = 500
        private constant real XP_PER_SECOND = 4
        private constant real XP_MAX = 8000         //Before multiplier is applied
    endglobals
    //

    globals 
        private timer Timer = null
        private real Time = 0
    endglobals

    function UnitDetermineLevel takes unit u, real mult returns nothing
        call SetHeroXP(u, R2I( RMinBJ( XP_BASE + XP_PER_SECOND * Time, XP_MAX ) * mult ), false)
    endfunction

    private function IncrementTime takes nothing returns nothing
        set Time = Time + 1
    endfunction

    private function Actions takes nothing returns nothing
        set Timer = CreateTimer()
        call TimerStart(Timer, 1, true, function IncrementTime)
    endfunction

    private function OnInit takes nothing returns nothing
        local trigger trig = CreateTrigger()
        call TriggerRegisterTimerEvent(trig, 0, false)
        call TriggerAddCondition(trig, Condition(function Actions))  
    endfunction    

endlibrary