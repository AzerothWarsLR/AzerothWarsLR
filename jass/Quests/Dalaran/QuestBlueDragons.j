library QuestBlueDragons initializer OnInit requires DalaranConfig, LegendNeutral, Display

  globals
    private QuestItemData QUESTITEM_CAPTURE
    private constant integer RESEARCH_ID = 'R00U'
    private constant integer DRAGON_ID = 'n0AC'
  endglobals

  private function LegendOwnerChanges takes nothing returns nothing
    if GetTriggerLegend() == LEGEND_NEXUS and FACTION_DALARAN.Player == GetOwningPlayer(LEGEND_NEXUS.Unit) and FACTION_DALARAN.getQuestItemProgress(QUESTITEM_CAPTURE) == QUEST_PROGRESS_INCOMPLETE then
      call FACTION_DALARAN.setQuestItemProgress(QUESTITEM_CAPTURE, QUEST_PROGRESS_COMPLETE, true)
      call SetPlayerTechResearched(FACTION_DALARAN.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(FACTION_DALARAN.Player, DRAGON_ID, "You can now train Blue Dragons from the Nexus.")
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
    call FACTION_DALARAN.modObjectLimit(DRAGON_ID, 6)
  endfunction

endlibrary