library QuestKarazhan requires DalaranConfig, LegendNeutral

  globals
    private QuestItemData QUESTITEM_CAPTURE
    private constant integer RESEARCH_ID = 0
  endglobals

  private function LegendOwnerChanges takes nothing returns nothing
    if GetTriggerLegend() == LEGEND_KARAZHAN and FACTION_DALARAN.Person.p == GetOwningPlayer(LEGEND_KARAZHAN.Unit) and FACTION_DALARAN.getQuestItemProgress(QUESTITEM_CAPTURE) == QUEST_PROGRESS_INCOMPLETE then
      call FACTION_DALARAN.setQuestItemStatus(QUESTITEM_CAPTURE, QUEST_PROGRESS_COMPLETE, true)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local QuestData tempQuest
    set trig = CreateTrigger()
    call OnLegendChangeOwner.register(trig)
    call TriggerAddCondition(trig, Condition(function LegendOwnerChanges))

    set tempQuest = QuestData.create("Ivory Spire of Karazhan", "The mysterious spire of Medivh stands mysteriously idle. Dalaran could make use of its grand magicks.", "Karazhan has been captured. Dalaran's archivists scour its halls for arcane resources." , "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp")
    set QUESTITEM_CAPTURE = tempQuest.addItem("Capture Karazhan")
    call FACTION_DALARAN.addQuest(tempQuest) 
  endfunction

endlibrary