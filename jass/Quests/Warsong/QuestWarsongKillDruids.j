library WarsongKillDruids initializer OnInit requires WarsongConfig, LegendDruids, Display

  globals
    private QuestItemData QUESTITEM_NORDRASSIL
    private constant integer RESEARCH_ID = 'R059'
  endglobals

  private function NodrassilCaptured takes nothing returns nothing
    if FACTION_WARSONG.Person.Team.containsPlayer(GetOwningPlayer(GetTriggerUnit())) then
      call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_NORDRASSIL, QUEST_PROGRESS_COMPLETE, true)
      call SetPlayerTechResearched(FACTION_WARSONG.Person.p, RESEARCH_ID, 1)
      call DisplayResearchAcquired(FACTION_WARSONG.Person.p, RESEARCH_ID, 1)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local QuestData tempQuest
    local trigger trig

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_NORDRASSIL.Unit, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction(trig, function NodrassilCaptured)

    set tempQuest = QuestData.create("Tear It Down", "The World Tree, Nordrassil, is the Night Elves' source of immortality. Capture it to cripple the Druids and supply the Warsong with an incredible source of lumber.", "Nordrassil has been captured. Goblin Shredders begin immediate harvesting operations and are outfitted with newer, more effective equipment.","ReplaceableTextures\\CommandButtons\\BTNFountainOfLife.blp")
    set QUESTITEM_NORDRASSIL = tempQuest.addItem("Nordrassil is captured")
    call FACTION_WARSONG.addQuest(tempQuest)
    call FACTION_WARSONG.modObjectLimit(RESEARCH_ID, UNLIMITED)
  endfunction

endlibrary