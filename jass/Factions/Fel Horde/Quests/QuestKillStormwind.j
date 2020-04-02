library QuestKillStormwind initializer OnInit requires QuestData, FelHordeConfig

  globals
    private QuestData QUEST
    private QuestItemData QUESTITEM_KILL
    private QuestItemData QUESTITEM_WAIT

    private real TIMER = 20 //1500
    private integer RESEARCH = 'R05Z'

    private boolean TimerEnded = false
  endglobals

  private function TryComplete takes nothing returns nothing
    if TimerEnded and not UnitAlive(gg_unit_h00X_0007) then
      call FACTION_FEL_HORDE.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
      call SetPlayerTechResearched(FACTION_FEL_HORDE.whichPerson.p, RESEARCH, 1)
    endif
  endfunction

  private function TimerEnds takes nothing returns nothing
    call FACTION_FEL_HORDE.setQuestItemStatus(QUESTITEM_WAIT, QUEST_PROGRESS_COMPLETE, true)
    set TimerEnded = true
    call TryComplete()
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterUnitEvent(trig, gg_unit_h00X_0007, EVENT_UNIT_DEATH)
    call TriggerAddAction(trig, function TryComplete)

    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, TIMER, false)
    call TriggerAddAction(trig, function TimerEnds)   

    set QUEST = QuestData.create("Savage Negotations", "Diplomatic negotations amongst the Fel Orcish clans are prolonged, deadly engagements. Only the destruction of Stormwind will truly rally the clans, for it would signal the beginning of Magtheridon's ultimate invasion.", "The sheer brutality of Magtheridon's conquest has reached the ears of each of the Fel Horde clans. The Shadowmoon Clan and the Dragonmaw Clan offer up their allegiances, demanding participation in the coming bloodshed.", "ReplaceableTextures\\CommandButtons\\BTNChaosGrunt.blp")
    set QUESTITEM_KILL = QUEST.addItem("Destroy Stormwind Keep")
    set QUESTITEM_WAIT = QUEST.addItem("Wait 25 minutes")
    call FACTION_FEL_HORDE.addQuest(QUEST)
  endfunction

endlibrary