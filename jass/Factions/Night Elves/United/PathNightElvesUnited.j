library PathNightElvesUnited initializer OnInit requires Persons, Faction, LegendSentinels, LegendDruids

  private function ApplyPath takes nothing returns nothing
    local player triggerPlayer = GetTriggerPlayer()
    local Person triggerPerson = Persons[GetPlayerId(triggerPlayer)]
    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "The Night Elves have united under one banner!")        

    call LEGEND_MAIEV.Spawn(triggerPlayer, -15466, 3075, 245)
    call LEGEND_TYRANDE.Spawn(triggerPlayer, -15466, 3075, 245)
    if not UnitAlive(LEGEND_CENARIUS.Unit) then
      call LEGEND_CENARIUS.Spawn(triggerPlayer, -11679, 6904, 255)
    endif
    if LEGEND_MALFURION.OwningPlayer != triggerPlayer then
      call LEGEND_MALFURION.Spawn(triggerPlayer, -11808, 6931, 247)
    endif
    call UnitTransferItems(LEGEND_FANDRAL.Unit, LEGEND_TYRANDE.Unit)
    set LEGEND_FANDRAL.Unit = null 

    call triggerPerson.setFaction(FACTION_NIGHT_ELVES)

    //Apply free technologies
    call SetPlayerTechResearched(triggerPlayer, 'R00V', 1)  //Balance Mastery
    call SetPlayerTechResearched(triggerPlayer, 'R04O', 1)  //Sentinel Buff
    call SetPlayerTechResearched(triggerPlayer, 'R04P', 1)  //Nature Buff
    call SetPlayerTechResearched(triggerPlayer, 'R02G', 2)  //Druid of the Growth Adept Training
  endfunction

  private function Research takes nothing returns nothing
    if GetResearched() == 'R04H' then
      call ApplyPath()
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition( trig, Condition(function Research) )   
  endfunction

endlibrary