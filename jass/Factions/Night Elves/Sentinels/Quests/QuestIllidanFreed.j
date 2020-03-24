library QuestIllidanFreed initializer OnInit requires QuestData, SentinelsConfig

  globals
    private constant real TIMER_DURATION = 480.

    private QuestData QUEST_ILLIDAN
    private QuestItemData QUESTITEM_FREED
    private QuestItemData QUESTITEM_TIME
  endglobals

  private function TimerEnds takes nothing returns nothing
    if GetOwningPlayer(gg_unit_Eill_2459) != FACTION_SENTINELS.whichPerson.p then
      call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_TIME, QUEST_PROGRESS_FAILED, false)
      call KillUnit(gg_unit_Eill_2459)
    endif
  endfunction

  private function Dies takes nothing returns nothing
    local unit maiev = gg_unit_Ewrd_0438
    local unit illidan = gg_unit_Eill_2459
    local Person killingPerson = 0
    local Person sentinelsPerson = 0

    if PersonsByFaction[FACTION_SENTINELS] != 0 then
      set killingPerson = Persons[GetPlayerId(GetOwningPlayer(GetKillingUnit()))]
      set sentinelsPerson = PersonsByFaction[FACTION_SENTINELS]
      if killingPerson.team == TEAM_NIGHT_ELVES and GetOwningPlayer(maiev) != sentinelsPerson.p and GetOwningPlayer(illidan) == Player(PLAYER_NEUTRAL_PASSIVE)  then //Night Elves team
        call KillUnit(gg_unit_n08W_2160)    //Illidan's prison
        call UnitRescue(illidan, sentinelsPerson.p)
        call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_FREED, QUEST_PROGRESS_COMPLETE, true)
      else
        call KillUnit(illidan)
        call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_FREED, QUEST_PROGRESS_FAILED, true)
      endif
    endif

    //Cleanup
    set illidan = null
    set maiev = null
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_Ekgg_2463, EVENT_UNIT_DEATH )
    call TriggerAddCondition(trig, Condition(function Dies))  

    //Timer ends
    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, TIMER_DURATION, false)
    call TriggerAddAction(trig, function TimerEnds)

    set QUEST_ILLIDAN = QuestData.create("The Betrayer", "Illidan the Betrayer has been imprisoned for ten thousand years. Now, his help may be required if the Night Elves are to survive.", "Illidan has been released from captivity.", "ReplaceableTextures\\CommandButtons\\BTNHeroDemonHunter.blp")
    set QUESTITEM_FREED = QUEST_ILLIDAN.addItem("Kill Califax in Illidan's Prison")
    set QUESTITEM_TIME = QUEST_ILLIDAN.addItem("Do not let Illidan stay imprisoned for 8 turns")
    call FACTION_SENTINELS.addQuest(QUEST_ILLIDAN)
    call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_TIME, QUEST_PROGRESS_COMPLETE, false)
  endfunction

endlibrary