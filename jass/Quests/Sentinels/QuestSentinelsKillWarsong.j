library SentinelsKillWarsong initializer OnInit requires SentinelsConfig, LegendWarsong, Display

  globals
    private QuestItemData QUESTITEM_STONEMAUL
    private QuestItemData QUESTITEM_ENCAMPMENT
  endglobals

  private function TryComplete takes nothing returns nothing
    if FACTION_SENTINELS.getQuestItemProgress(QUESTITEM_STONEMAUL) == QUEST_PROGRESS_COMPLETE and FACTION_SENTINELS.getQuestItemProgress(QUESTITEM_ENCAMPMENT) == QUEST_PROGRESS_COMPLETE then
      call DisplayHeroReward(LEGEND_SHANDRIS.Unit, 10, 10, 10, 0)
      call AddHeroAttributes(LEGEND_SHANDRIS.Unit, 10, 10, 10)
    endif
  endfunction

  private function StonemaulDies takes nothing returns nothing
    call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_STONEMAUL, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction

  private function EncampmentDies takes nothing returns nothing
    call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_ENCAMPMENT, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction

  private function OnInit takes nothing returns nothing
    local QuestData tempQuest
    local trigger trig

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_STONEMAUL.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function StonemaulDies)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_ENCAMPMENT.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function EncampmentDies)

    set tempQuest = QuestData.create("Green-skinned Brutes", "The Warsong Clan has arrived near Ashenvale and begun threatening the wilds. These invaders must be repelled.", "The Warsong presence on Kalimdor has been eliminated. The land has been protected from their misbegotten race.","ReplaceableTextures\\CommandButtons\\BTNRaider.blp")
    set QUESTITEM_STONEMAUL = tempQuest.addItem("Stonemaul Keep is destroyed")
    set QUESTITEM_ENCAMPMENT = tempQuest.addItem("The Warsong Encampment on the Darkspear Isles is destroyed")
    call FACTION_SENTINELS.addQuest(tempQuest)
    set FACTION_SENTINELS.StartingQuest = tempQuest
  endfunction

endlibrary