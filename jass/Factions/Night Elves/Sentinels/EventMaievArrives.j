//If Illidan is not under the Sentinel's control by the timer, OR a player becomes Illidari, give Maiev to the Sentinels.
//This should not apply for the Night Elves, since they already have Maiev.

library EventMaievArrives initializer OnInit requires Persons, Faction, DetermineLevel

  globals
    private constant real TIMER_DURATION = 480.
    private trigger TimerTrig
    private trigger FactionTrig

    private unit Maiev
    private unit Naisha
    private unit Illidan
  endglobals

  private function EnableUnitForPlayer takes unit u, player p returns nothing
    call ShowUnit(u, true)
    call SetUnitInvulnerable(u, false)
    call SetUnitOwner(u, p, true)
  endfunction

  private function TimerEnds takes nothing returns nothing
    local Person sentinelPerson = PersonsByFaction[FACTION_SENTINELS]
    if sentinelPerson != 0 and GetOwningPlayer(Illidan) != sentinelPerson.p and GetOwningPlayer(Maiev) != sentinelPerson.p then
      call DisplayTextToForce(GetPlayersAll(), "Maiev has emerged to hunt down the Betrayer.")
      call EnableUnitForPlayer(Maiev, sentinelPerson.p)
      call UnitDetermineLevel(Maiev, 1.)
      call EnableUnitForPlayer(Naisha, sentinelPerson.p)
    endif
  endfunction

  private function PersonChangesFaction takes nothing returns nothing
    local Person sentinelPerson = 0
    if GetTriggerPerson().faction == FACTION_ILLIDARI then
      set sentinelPerson = PersonsByFaction[FACTION_SENTINELS]
      if sentinelPerson != 0 and GetOwningPlayer(Maiev) != sentinelPerson.p then
        call DisplayTextToForce(GetPlayersAll(), "Maiev has emerged to hunt down the Betrayer.")
        call EnableUnitForPlayer(Maiev, sentinelPerson.p)
        call EnableUnitForPlayer(Naisha, sentinelPerson.p)
        //If Sentinels currently have Illidan, take him away and transfer everything to Maiev. Otherwise, spawn Maiev with new hero XP
        if GetOwningPlayer(Illidan) == sentinelPerson.p then
          call SetUnitX(Maiev, GetUnitX(Illidan))
          call SetUnitY(Maiev, GetUnitY(Illidan))
          call SetHeroXP(Maiev, GetHeroXP(Illidan), true)
          call UnitTransferItems(Illidan, Maiev)
        else
          call UnitDetermineLevel(Maiev, 1.)
        endif
        call RemoveUnit(Illidan)
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    //Timer ends
    set TimerTrig = CreateTrigger()
    call TriggerRegisterTimerEvent(TimerTrig, TIMER_DURATION, false)
    call TriggerAddAction(TimerTrig, function TimerEnds)
    //Someone's faction changes
    set FactionTrig = CreateTrigger()
    call OnPersonFactionChange.register(FactionTrig)
    call TriggerAddAction(FactionTrig, function PersonChangesFaction)
    //Assign units
    set Maiev = gg_unit_Ewrd_0438
    set Naisha = gg_unit_ensh_0094
    set Illidan = gg_unit_Eill_2459
  endfunction

endlibrary