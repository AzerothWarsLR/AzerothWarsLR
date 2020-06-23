library WarsongKillSentinels initializer OnInit requires WarsongConfig, LegendSentinels, Display

  globals
    private QuestItemData QUESTITEM_AUBERDINE
    private QuestItemData QUESTITEM_FEATHERMOON

    private constant integer RESEARCH_ID = 'R058'
  endglobals

  private function TryComplete takes nothing returns nothing
    if FACTION_WARSONG.getQuestItemProgress(QUESTITEM_AUBERDINE) == QUEST_PROGRESS_COMPLETE and FACTION_WARSONG.getQuestItemProgress(QUESTITEM_FEATHERMOON) == QUEST_PROGRESS_COMPLETE then
      call SetPlayerTechResearched(FACTION_WARSONG.Person.p, RESEARCH_ID, 1)
      call DisplayResearchAcquired(FACTION_WARSONG.Person.p, RESEARCH_ID, 1)
    endif
  endfunction

  private function AuberdineDies takes nothing returns nothing
    call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_AUBERDINE, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction

  private function FeathermoonDies takes nothing returns nothing
    call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_FEATHERMOON, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction

  private function OnInit takes nothing returns nothing
    local QuestData tempQuest
    local trigger trig

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_AUBERDINE.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function AuberdineDies)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_FEATHERMOON.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function FeathermoonDies)

    set tempQuest = QuestData.create("Perfect Warriors", "The prowess and savagery of the Sentinels is to be respected - and feared. They must be eliminated.", "The Sentinels have been destroyed, proving once and for all that the Orcish Horde stands dominant on the battlefield.","ReplaceableTextures\\CommandButtons\\BTNHuntress.blp")
    set QUESTITEM_AUBERDINE = tempQuest.addItem("Auberdine is destroyed")
    set QUESTITEM_FEATHERMOON = tempQuest.addItem("Feathermoon Stronghold is destroyed")
    call FACTION_WARSONG.addQuest(tempQuest)
  endfunction

endlibrary