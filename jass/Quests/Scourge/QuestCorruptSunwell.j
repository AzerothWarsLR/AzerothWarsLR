library QuestCorruptSunwell initializer OnInit requires ScourgeConfig, LegendQuelthalas

  globals
    private QuestItemData QUESTITEM_CAPTURE
    private constant integer RESEARCH_ID = 'R04K'
    private constant integer DARKFALLEN_ID = 'h04A'
  endglobals

  private function LegendOwnerChanges takes nothing returns nothing
    if GetTriggerLegend() == LEGEND_SUNWELL and FACTION_SCOURGE.Team.ContainsPlayer(GetOwningPlayer(LEGEND_SUNWELL.Unit)) and FACTION_SCOURGE.getQuestItemProgress(QUESTITEM_CAPTURE) == QUEST_PROGRESS_INCOMPLETE then
      call SetUnitAnimation(LEGEND_SUNWELL.Unit, "stand second")
      call SetUnitAnimation(LEGEND_SUNWELL.Unit, "stand third")
      call FACTION_SCOURGE.setQuestItemProgress(QUESTITEM_CAPTURE, QUEST_PROGRESS_COMPLETE, true)
      call SetPlayerTechResearched(FACTION_SCOURGE.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(FACTION_SCOURGE.Player, DARKFALLEN_ID, "You can now train " + GetObjectName(DARKFALLEN_ID) + " from the Temple of the Damned.")
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local QuestData tempQuest
    set trig = CreateTrigger()
    call OnLegendChangeOwner.register(trig)
    call TriggerAddCondition(trig, Condition(function LegendOwnerChanges))

    set tempQuest = QuestData.create("Fall of Silvermoon", "The Sunwell is the source of the High Elves' immortality and magical prowess. Under control of the Scourge, it would be the source of immense necromantic power.", "The Sunwell has been captured by the Scourge. It now writhes with necromantic energy." , "ReplaceableTextures\\CommandButtons\\BTNOrbOfCorruption.blp")
    set QUESTITEM_CAPTURE = tempQuest.addItem("Capture the Sunwell")
    call FACTION_SCOURGE.addQuest(tempQuest) 
  endfunction

endlibrary