//If Illidan is not under the Sentinel's control by the timer, OR a player becomes Illidari, give Maiev to the Sentinels.
//This should not apply for the Night Elves, since they already have Maiev.

library QuestMaievArrives initializer OnInit requires QuestData,DetermineLevel, GeneralHelpers, SentinelsConfig

  globals
    private constant real TIMER_DURATION = 480.
    private trigger TimerTrig
    private trigger FactionTrig

    private unit Maiev
    private unit Naisha
    private unit Illidan

    private QuestData QUEST_MAIEV
    private QuestItemData QUESTITEM_WAIT
    private QuestItemData QUESTITEM_DONT
  endglobals

  private function TimerEnds takes nothing returns nothing
    local Person sentinelPerson = PersonsByFaction[FACTION_SENTINELS]
    if sentinelPerson != 0 and GetOwningPlayer(Illidan) != sentinelPerson.p and GetOwningPlayer(Maiev) != sentinelPerson.p then
      call DisplayTextToForce(GetPlayersAll(), "Maiev has emerged to hunt down the Betrayer.")
      call UnitRescue(Maiev, sentinelPerson.p)
      call UnitDetermineLevel(Maiev, 1.)
      call UnitRescue(Naisha, sentinelPerson.p)
      call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_DONT, QUEST_PROGRESS_COMPLETE, false)
      call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_WAIT, QUEST_PROGRESS_COMPLETE, true)
    endif
  endfunction

  private function PersonChangesFaction takes nothing returns nothing
    local Person sentinelPerson = 0
    if GetTriggerPerson().faction == FACTION_ILLIDARI then
      set sentinelPerson = PersonsByFaction[FACTION_SENTINELS]
      if sentinelPerson != 0 and GetOwningPlayer(Maiev) != sentinelPerson.p then
        call UnitRescue(Maiev, sentinelPerson.p)
        call UnitRescue(Naisha, sentinelPerson.p)
        call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_DONT, QUEST_PROGRESS_COMPLETE, false)
        call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_WAIT, QUEST_PROGRESS_COMPLETE, true)
        //If Sentinels currently have Illidan, take him away and transfer everything to Maiev. Just give her new hero EXP
        if GetOwningPlayer(Illidan) == sentinelPerson.p then
          call SetUnitX(Maiev, GetUnitX(Illidan))
          call SetUnitY(Maiev, GetUnitY(Illidan))
          call SetHeroXP(Maiev, GetHeroXP(Illidan), true)
          call UnitTransferItems(Illidan, Maiev)
        else
          call UnitDetermineLevel(Maiev, 1.)
        endif
        call UnitRescue(Maiev, sentinelPerson.p)
        call RemoveUnit(Illidan)
      endif
    endif
  endfunction

  private function IllidanChangesOwner takes nothing returns nothing
    if GetOwningPlayer(GetTriggerUnit()) == FACTION_SENTINELS.whichPerson.p then
      call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_DONT, QUEST_PROGRESS_FAILED, false)
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    //Assign units
    set Maiev = gg_unit_Ewrd_0438
    set Naisha = gg_unit_ensh_0094
    set Illidan = gg_unit_Eill_2459
    //Timer ends
    set TimerTrig = CreateTrigger()
    call TriggerRegisterTimerEvent(TimerTrig, TIMER_DURATION, false)
    call TriggerAddAction(TimerTrig, function TimerEnds)
    //Someone's faction changes
    set FactionTrig = CreateTrigger()
    call OnPersonFactionChange.register(FactionTrig)
    call TriggerAddAction(FactionTrig, function PersonChangesFaction)
    //Illidan changes control
    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent(trig, Illidan, EVENT_UNIT_CHANGE_OWNER)
    call TriggerAddAction(trig, function IllidanChangesOwner)
    

    set QUEST_MAIEV = QuestData.create("The Warden", "Maiev Shadowsong is the senior Warden of the Night Elves. As long as Illidan is not freed from his prison, she will be available to assist the Sentinel forces.", "Maiev has arrived to assist the Sentinel forces.", "ReplaceableTextures\\CommandButtons\\BTNWarden2.blp")
    set QUESTITEM_WAIT = QUEST_MAIEV.addItem("Survive until turn 8")
    set QUESTITEM_DONT = QUEST_MAIEV.addItem("Do not free Illidan from the Barrow Den")
    call FACTION_SENTINELS.addQuest(QUEST_MAIEV)
    call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_DONT, QUEST_PROGRESS_COMPLETE, false)
  endfunction

endlibrary