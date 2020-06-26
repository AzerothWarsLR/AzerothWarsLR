library QuestScourgeKillDalaran initializer OnInit requires ScourgeConfig, LegendDalaran, Display

  globals
    private QuestItemData QUESTITEM_DALARAN
  endglobals

  private function DalaranDies takes nothing returns nothing
    if FACTION_SCOURGE.getQuestItemProgress(QUESTITEM_DALARAN) == QUEST_PROGRESS_INCOMPLETE then
      call FACTION_SCOURGE.setQuestItemProgress(QUESTITEM_DALARAN, QUEST_PROGRESS_COMPLETE, true)
      call FACTION_SCOURGE.modObjectLimit('uobs', 2)
      call DisplayUnitLimit(FACTION_SCOURGE, 'uobs')
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local QuestData tempQuest
    local trigger trig

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_DALARAN.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function DalaranDies)

    set tempQuest = QuestData.create("Forbidden Knowledge", "The libraries of Dalaran are filled with magical secrets that could be used to educate the Cult of the Damned, enabling them to repair more Obsidian Statues.", "Dalaran has been razed, and its libraries plundered.","ReplaceableTextures\\CommandButtons\\BTNBookOfTheDead.blp")
    set QUESTITEM_DALARAN = tempQuest.addItem("The Violet Citadel is destroyed")
    call FACTION_SCOURGE.addQuest(tempQuest)
  endfunction

endlibrary