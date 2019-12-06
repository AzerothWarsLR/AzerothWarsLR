library EventIllidanFreed initializer OnInit

  private function EnableUnitForPlayer takes unit u, player p returns nothing
    call ShowUnit(u, true)
    call SetUnitInvulnerable(u, false)
    call SetUnitOwner(u, p, true)
  endfunction

  private function Dies takes nothing returns nothing
    local unit maiev = gg_unit_Ewrd_0438
    local unit amara = gg_unit_h02F_3401
    local unit illidan = gg_unit_Eill_2459
    local Person killingPerson = 0
    local Person sentinelsPerson = 0

    if PersonsByFaction[9] != 0 then
      set killingPerson = Persons[GetPlayerId(GetOwningPlayer(GetKillingUnit()))]
      set sentinelsPerson = PersonsByFaction[9]
      if killingPerson.getTeam() == TEAM_NIGHT_ELVES and GetOwningPlayer(maiev) != sentinelsPerson.getPlayer() and GetOwningPlayer(illidan) == Player(PLAYER_NEUTRAL_PASSIVE)  then //Night Elves team
        call DisplayTextToForce(GetPlayersAll(), "Illidan has been released from his prison in the Barrow Deeps.")
        call KillUnit(gg_unit_n08W_2160)    //Illidan's prison
        call EnableUnitForPlayer(illidan, sentinelsPerson.getPlayer())
        call EnableUnitForPlayer(amara, sentinelsPerson.getPlayer())
      endif
    endif

    //Cleanup
    set illidan = null
    set maiev = null
    set amara = null
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_Ekgg_2463, EVENT_UNIT_DEATH )
    call TriggerAddCondition(trig, Condition(function Dies))       
  endfunction

endlibrary