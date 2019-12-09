//If Illidan is not under the Sentinel's control by the timer, give Maiev to the Sentinels.
//This should not apply for the Night Elves, since they already have Maiev.

library EventMaievArrives initializer OnInit requires Persons, Faction

    globals
        private constant real TIMER_DURATION = 480.
    endglobals

    private function EnableUnitForPlayer takes unit u, player p returns nothing
        call ShowUnit(u, true)
        call SetUnitInvulnerable(u, false)
        call SetUnitOwner(u, p, true)
    endfunction

    private function TimerEnds takes nothing returns nothing
        local Person sentinelPerson = PersonsByFaction[FACTION_SENTINELS]
        local unit maiev = gg_unit_Ewrd_0438
        local unit naisha = gg_unit_ensh_0094
        local unit illidan = gg_unit_Eill_2459

        if sentinelPerson != 0 and GetOwningPlayer(illidan) != sentinelPerson.getPlayer() then
            call DisplayTextToForce(GetPlayersAll(), "Maiev has emerged to hunt down the Betrayer.")
            call EnableUnitForPlayer(maiev, sentinelPerson.getPlayer())
            call UnitDetermineLevel(maiev, 1.0)
            call EnableUnitForPlayer(naisha, sentinelPerson.getPlayer())
        endif

        call DestroyTrigger(GetTriggeringTrigger())
        set maiev = null
        set naisha = null
        set illidan = null
    endfunction

    private function OnInit takes nothing returns nothing
        local trigger trig = CreateTrigger()
        call TriggerRegisterTimerEvent(trig, TIMER_DURATION, false)
        call TriggerAddCondition(trig, Condition(function TimerEnds))    
    endfunction

endlibrary