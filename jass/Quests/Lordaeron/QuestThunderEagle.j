library QuestThunderEagle initializer OnInit requires QuestData, ControlPoint, LordaeronConfig, LegendLegion

  globals
    private QuestItemData QUESTITEM_KILL
    private QuestItemData QUESTITEM_CAPTURE
    private constant integer RESEARCH_ID = 'R04L'
    private constant integer THUNDER_EAGLE_ID = 'nwe2'
  endglobals

  private function TryComplete takes nothing returns nothing
    if FACTION_LORDAERON.getQuestItemProgress(QUESTITEM_KILL) == QUEST_PROGRESS_COMPLETE and FACTION_LORDAERON.getQuestItemProgress(QUESTITEM_CAPTURE) == QUEST_PROGRESS_COMPLETE then
      call SetPlayerTechResearched(FACTION_LORDAERON.Person.p, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(FACTION_DALARAN.Person.p, 'n0AC', "You can now train Thunder Eagles from upgraded Town Halls and from your capitals.")
    endif
  endfunction

  private function Dies takes nothing returns nothing
    call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function Capture takes nothing returns nothing
    local Person capturePerson
    if GetUnitTypeId(GetTriggerControlPoint().u) == 'n02S' and FACTION_LORDAERON.Person.Team.containsPlayer(GetOwningPlayer(GetTriggerControlPoint().u)) then
      call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_CAPTURE, QUEST_PROGRESS_COMPLETE, true)
      call TryComplete()
      call DestroyTrigger(GetTriggeringTrigger())
    else
      call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_CAPTURE, QUEST_PROGRESS_INCOMPLETE, false)
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
    set tempQuest = QuestData.create("To the Skies!", "The Thunder Eagles of the Storm Peaks live in fear of the Legion. Wipe out the Legion Nexus to bring these great birds out into the open.", "The Thunder Eagles, now in safe hands, fly for Lordaeron.", "ReplaceableTextures\\CommandButtons\\BTNWarEagle.blp")
    set QUESTITEM_KILL = tempQuest.addItem("The Legion Nexus is destroyed")
    set QUESTITEM_CAPTURE = tempQuest.addItem("Capture Storm Peaks")
    call FACTION_LORDAERON.addQuest(tempQuest)
    call FACTION_LORDAERON.modObjectLimit(RESEARCH_ID, UNLIMITED)
  endfunction

endlibrary