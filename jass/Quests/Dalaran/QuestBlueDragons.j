library QuestBlueDragons initializer OnInit requires DalaranConfig, LegendNeutral, Display

  globals
    private QuestItemData QUESTITEM_CAPTURE
    private constant integer RESEARCH_ID = 'R00U'
  endglobals

  private function LegendOwnerChanges takes nothing returns nothing
    if GetTriggerLegend() == LEGEND_NEXUS and FACTION_DALARAN.Person.p == GetOwningPlayer(LEGEND_NEXUS.Unit) and FACTION_DALARAN.getQuestItemProgress(QUESTITEM_CAPTURE) == QUEST_PROGRESS_INCOMPLETE then
      call FACTION_DALARAN.setQuestItemStatus(QUESTITEM_CAPTURE, QUEST_PROGRESS_COMPLETE, true)
      call SetPlayerTechResearched(FACTION_DALARAN.Person.p, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(FACTION_DALARAN.Person.p, 'n0AC', "You can now train Blue Dragons from the Nexus.")
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local QuestData tempQuest
    set trig = CreateTrigger()
    call OnLegendChangeOwner.register(trig)
    call TriggerAddCondition(trig, Condition(function LegendOwnerChanges))

    set tempQuest = QuestData.create("The Blue Dragonflight", "The Blue Dragons of Northrend are the wardens of magic on Azeroth. They might be convinced to willingly join the mages of Dalaran.", "The Nexus has been captured. The Blue Dragonflight fights for Dalaran." , "ReplaceableTextures\\CommandButtons\\BTNAzureDragon.blp")
    set QUESTITEM_CAPTURE = tempQuest.addItem("Capture the Nexus in Northrend")
    call FACTION_DALARAN.addQuest(tempQuest) 
  endfunction

endlibrary