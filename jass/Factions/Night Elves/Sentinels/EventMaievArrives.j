//If Illidan is not under the Sentinel's control by the timer, OR a player becomes Illidari, give Maiev to the Sentinels.
//This should not apply for the Night Elves, since they already have Maiev.

library EventMaievArrives initializer OnInit requires Persons, Faction

  globals
    private constant real TIMER_DURATION = 480.
    private trigger TimerTrig
    private trigger FactionTrig
  endglobals

  private function EnableUnitForPlayer takes unit u, player p returns nothing
    call ShowUnit(u, true)
    call SetUnitInvulnerable(u, false)
    call SetUnitOwner(u, p, true)
  endfunction

  private function MaievArrives takes nothing returns nothing
    local Person sentinelPerson = PersonsByFaction[FACTION_SENTINELS]
    local unit maiev = gg_unit_Ewrd_0438
    local unit naisha = gg_unit_ensh_0094
    local unit illidan = gg_unit_Eill_2459

    if sentinelPerson != 0 and GetOwningPlayer(illidan) != sentinelPerson.p and GetOwningPlayer(maiev) != sentinelPerson.p then
      call DisplayTextToForce(GetPlayersAll(), "Maiev has emerged to hunt down the Betrayer.")
      call EnableUnitForPlayer(maiev, sentinelPerson.p)
      call UnitDetermineLevel(maiev, 1.0)
      call EnableUnitForPlayer(naisha, sentinelPerson.p)
    endif

    call DestroyTrigger(TimerTrig)
    call DestroyTrigger(FactionTrig)
    set maiev = null
    set naisha = null
    set illidan = null
  endfunction

  private function TimerEnds takes nothing returns nothing
    call MaievArrives()
  endfunction

  private function PersonChangesFaction takes nothing returns nothing
    if GetTriggerPerson().faction == FACTION_ILLIDARI then
      call MaievArrives()
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    //Timer ends
    call TriggerRegisterTimerEvent(TimerTrig, TIMER_DURATION, false)
    call TriggerAddAction(TimerTrig, function TimerEnds)
    //Someone's faction changes
    call OnPersonFactionChange.register(FactionTrig)
    call TriggerAddAction(FactionTrig, function PersonChangesFaction)
  endfunction

endlibrary