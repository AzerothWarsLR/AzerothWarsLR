library QuestLegionCaptureSunwell initializer OnInit requires LegionConfig, LegendQuelthalas

  globals
    private QuestItemData QUESTITEM_CAPTURE
    private constant integer RESEARCH_ID = 'R054'
  endglobals

  private function LegendOwnerChanges takes nothing returns nothing
    if GetTriggerLegend() == LEGEND_SUNWELL and FACTION_LEGION.Person.Team.containsPlayer(GetOwningPlayer(LEGEND_SUNWELL.Unit)) and FACTION_LEGION.getQuestItemProgress(QUESTITEM_CAPTURE) == QUEST_PROGRESS_INCOMPLETE then
      call FACTION_LEGION.setQuestItemStatus(QUESTITEM_CAPTURE, QUEST_PROGRESS_COMPLETE, true)
      call SetPlayerTechResearched(FACTION_LEGION.Person.p, RESEARCH_ID, 1)
      call DisplayResearchAcquired(FACTION_LEGION.Person.p, RESEARCH_ID, 1)
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local QuestData tempQuest
    set trig = CreateTrigger()
    call OnLegendChangeOwner.register(trig)
    call TriggerAddCondition(trig, Condition(function LegendOwnerChanges))

    set tempQuest = QuestData.create("Still Waters", "The Sunwell is the source of the High Elves' immortality and magical prowess. The Legion's Dreadlords could make use of that energy.", "The Sunwell has been captured. The Nazrethim flock to its plentiful waters to take the energies for themselves." , "ReplaceableTextures\\CommandButtons\\BTNHeroDreadlord.blp")
    set QUESTITEM_CAPTURE = tempQuest.addItem("Capture the Sunwell")
    call FACTION_LEGION.addQuest(tempQuest) 
    call FACTION_LEGION.registerObjectLimit(RESEARCH_ID, UNLIMITED)
  endfunction

endlibrary