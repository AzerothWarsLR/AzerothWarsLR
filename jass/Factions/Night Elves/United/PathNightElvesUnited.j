library PathNightElvesUnited initializer OnInit requires Persons, Faction, Team, GeneralHelpers, DetermineLevel

  private function ApplyPath takes nothing returns nothing
    local player triggerPlayer = GetTriggerPlayer()
    local Person triggerPerson = Persons[GetPlayerId(triggerPlayer)]
    local item tempItem = null
    local unit u = null
    local unit malfurion = gg_unit_Efur_3093
    local unit cenarius = gg_unit_Ecen_1213
    local unit illidan = gg_unit_Eill_2459
    local unit fandral = gg_unit_E00K_2993
    local unit tyrande = gg_unit_Etyr_1241
    local unit shandris = gg_unit_E002_1221
    local unit maiev = gg_unit_Ewrd_0438

    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "The Night Elves have united under one banner!")        

    //Sentinels triggered the research
    if triggerPerson.faction == FACTION_SENTINELS then             
      set u = CreateUnit(triggerPlayer, 'Ecen', -11679, 6904, 255)   //Cenarius
      call UnitDetermineLevel(u, 1.2)
      set cenarius = u
      set u = CreateUnit(triggerPlayer, 'Efur', -11808, 6931, 247)   //Malfurion
      call UnitDetermineLevel(u, 0.9)
      set malfurion = u
      call UnitAddItem(malfurion, tempItem)
      if GetOwningPlayer(illidan) == triggerPlayer then 
        call UnitTransferItems(illidan, cenarius)
        call RemoveUnit(illidan)                    
      endif       
      if GetOwningPlayer(maiev) != triggerPlayer then
        set u = CreateUnit(triggerPlayer, 'Ewrd', -15466, 3075, 245)   //Maiev
        call UnitDetermineLevel(u, 0.9)
      endif
      call UnitTransferItems(shandris, malfurion)
      call RemoveUnit(shandris)     
    endif

    //Druids triggered the research
    if triggerPerson.faction == FACTION_DRUIDS then            //Druids
      set u = CreateUnit(triggerPlayer, 'Ewrd', -15466, 3075, 245)   //Maiev
      call UnitDetermineLevel(u, 0.9)
      set u = CreateUnit(triggerPlayer, 'Etyr', -15466, 3075, 245)   //Tyrande
      call UnitDetermineLevel(u, 1.1)
      set tyrande = u
      if not IsUnitAliveBJ(cenarius) then
        set u = CreateUnit(triggerPlayer, 'Ecen', -11679, 6904, 255)   //Cenarius
        call UnitDetermineLevel(u, 1.1)
      endif
      if GetOwningPlayer(malfurion) != triggerPlayer then
        set u = CreateUnit(triggerPlayer, 'Efur', -11808, 6931, 247)   //Malfurion
        call UnitDetermineLevel(u, 0.9)
        set malfurion = u
      endif
      call UnitTransferItems(fandral, tyrande)
      call RemoveUnit(fandral)                        //Fandral      
    endif

    //Set faction and team
    call triggerPerson.setFaction(20)                   //Night Elves
    call triggerPerson.setTeam(3)                       //Night Elves
    call triggerPerson.getTeam().setMaxSize(1)     

    //Apply free technologies
    call SetPlayerTechResearched(triggerPlayer, 'R00V', 1)  //Balance Mastery
    call SetPlayerTechResearched(triggerPlayer, 'R04O', 1)  //Sentinel Buff
    call SetPlayerTechResearched(triggerPlayer, 'R04P', 1)  //Nature Buff
    call SetPlayerTechResearched(triggerPlayer, 'R02G', 2)  //Druid of the Growth Adept Training                 

    //Cleanup
    set u = null
    set malfurion = null
    set cenarius = null
    set illidan = null
    set fandral = null
    set tyrande = null
    set shandris = null
    set maiev = null
    set tempItem = null
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