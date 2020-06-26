library QuestCrystalGolem initializer OnInit requires QuestData, ControlPoint, DalaranConfig, LegendLegion

  globals
    private QuestItemData QUESTITEM_KILL
    private QuestItemData QUESTITEM_CAPTURE
    private constant integer RESEARCH_ID = 'R045'
  endglobals

  private function TryComplete takes nothing returns nothing
    if FACTION_DALARAN.getQuestItemProgress(QUESTITEM_KILL) == QUEST_PROGRESS_COMPLETE and FACTION_DALARAN.getQuestItemProgress(QUESTITEM_CAPTURE) == QUEST_PROGRESS_COMPLETE then
      call SetPlayerTechResearched(FACTION_DALARAN.Person.p, RESEARCH_ID, 1)
      call DisplayResearchAcquired(FACTION_DALARAN.Person.p, RESEARCH_ID, 1)
      call FACTION_DALARAN.modObjectLimit('n096', -6)
      call FACTION_DALARAN.modObjectLimit('n0AD', 6)
    endif
  endfunction

  private function Dies takes nothing returns nothing
    call FACTION_DALARAN.setQuestItemProgress(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function Capture takes nothing returns nothing
    local Person capturePerson
    if GetUnitTypeId(GetTriggerControlPoint().u) == 'n02R' and FACTION_DALARAN.Person.Team.containsPlayer(GetOwningPlayer(GetTriggerControlPoint().u)) then
      call FACTION_DALARAN.setQuestItemProgress(QUESTITEM_CAPTURE, QUEST_PROGRESS_COMPLETE, true)
      call TryComplete()
      call DestroyTrigger(GetTriggeringTrigger())
    else
      call FACTION_DALARAN.setQuestItemProgress(QUESTITEM_CAPTURE, QUEST_PROGRESS_INCOMPLETE, false)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    local integer i = 0
    local unit u = null
    local QuestData tempQuest

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_LEGIONNEXUS.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function Dies)

    set trig = CreateTrigger()
    call OnControlPointOwnerChange.register(trig)
    call TriggerAddAction(trig, function Capture)

    //Quest setup
    set tempQuest = QuestData.create("Crystalsong Forest", "The living crystal of the Crystalsong Forest suffers from its proximity to the Legion. Freed from that corruption, it could be used to empower Dalaran's constructs.", "Dalaran's Earth Golems have been infused with living crystal.", "ReplaceableTextures\\CommandButtons\\BTNRockGolem.blp")
    set QUESTITEM_KILL = tempQuest.addItem("The Legion Nexus is destroyed")
    set QUESTITEM_CAPTURE = tempQuest.addItem("Capture Crystalsong Forest")
    call FACTION_DALARAN.addQuest(tempQuest)
    call FACTION_DALARAN.modObjectLimit(RESEARCH_ID, UNLIMITED)
  endfunction

endlibrary