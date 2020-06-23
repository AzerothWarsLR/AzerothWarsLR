library FrostwolfKillSentinels initializer OnInit requires FrostwolfConfig, LegendSentinels, Display

  globals
    private QuestItemData QUESTITEM_AUBERDINE
    private QuestItemData QUESTITEM_FEATHERMOON
  endglobals

  private function TryComplete takes nothing returns nothing
    if FACTION_FROSTWOLF.getQuestItemProgress(QUESTITEM_AUBERDINE) == QUEST_PROGRESS_COMPLETE and FACTION_FROSTWOLF.getQuestItemProgress(QUESTITEM_FEATHERMOON) == QUEST_PROGRESS_COMPLETE then
      call FACTION_FROSTWOLF.modObjectLimit('owyv', 2)
      call DisplayUnitLimit(FACTION_FROSTWOLF, 'owyv')
    endif
  endfunction

  private function AuberdineDies takes nothing returns nothing
    call FACTION_FROSTWOLF.setQuestItemStatus(QUESTITEM_AUBERDINE, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction

  private function FeathermoonDies takes nothing returns nothing
    call FACTION_FROSTWOLF.setQuestItemStatus(QUESTITEM_FEATHERMOON, QUEST_PROGRESS_COMPLETE, true)
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

    set tempQuest = QuestData.create("The Spirits of Ashenvale", "The Sentinels have laid claim over Kalimdor. As long as they survive, the Orcs will never be safe.", "The Sentinels have been eliminated. Warchief Thrall breathes a sigh of relief, knowing that his people are safe - for now.","ReplaceableTextures\\CommandButtons\\BTNArcher.blp")
    set QUESTITEM_AUBERDINE = tempQuest.addItem("Auberdine is destroyed")
    set QUESTITEM_FEATHERMOON = tempQuest.addItem("Feathermoon Stronghold is destroyed")
    call FACTION_FROSTWOLF.addQuest(tempQuest)
  endfunction

endlibrary