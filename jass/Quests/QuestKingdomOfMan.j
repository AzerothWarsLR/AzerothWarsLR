library QuestKingdomOfMan initializer OnInit requires LordaeronConfig, StormwindConfig, ControlPoint, ArtifactConfig

  globals
    private QuestItemData QUESTITEM_LORDAERON_CAPTURE_STORMWIND
    private QuestItemData QUESTITEM_LORDAERON_CROWNLORDAERON
    private QuestItemData QUESTITEM_LORDAERON_CROWNSTORMWIND
    private QuestItemData QUESTITEM_LORDAERON_ARTHAS

    private QuestItemData QUESTITEM_STORMWIND_CAPTURE_CAPITALPALACE
    private QuestItemData QUESTITEM_STORMWIND_CROWNLORDAERON
    private QuestItemData QUESTITEM_STORMWIND_CROWNSTORMWIND
    private QuestItemData QUESTITEM_STORMWIND_VARIAN

    private constant integer RESEARCH_ID = 'R01N'

    private boolean RewardedLordaeron = false
    private boolean RewardedStormwind = false
  endglobals

  private function Reward takes Faction whichFaction returns nothing
    if whichFaction == FACTION_LORDAERON then
      set RewardedLordaeron = true
      call UnitAddItem(LEGEND_ARTHAS.Unit, ARTIFACT_CROWNEASTERNKINGDOMS.item)
      call FACTION_STORMWIND.setQuestItemProgress(QUESTITEM_STORMWIND_CROWNLORDAERON, QUEST_PROGRESS_FAILED, false)
      call FACTION_STORMWIND.setQuestItemProgress(QUESTITEM_STORMWIND_CROWNSTORMWIND, QUEST_PROGRESS_FAILED, false)
    elseif whichFaction == FACTION_STORMWIND then
      set RewardedStormwind = true
      call UnitAddItem(LEGEND_VARIAN.Unit, ARTIFACT_CROWNEASTERNKINGDOMS.item)
      call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_LORDAERON_CROWNLORDAERON, QUEST_PROGRESS_FAILED, false)
      call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_LORDAERON_CROWNSTORMWIND, QUEST_PROGRESS_FAILED, false)
    endif
    call RemoveItem(ARTIFACT_CROWNLORDAERON.item)
    call RemoveItem(ARTIFACT_CROWNSTORMWIND.item)
    call ARTIFACT_CROWNLORDAERON.setStatus(ARTIFACT_STATUS_HIDDEN)
    call ARTIFACT_CROWNLORDAERON.setDescription("Melted down")
    call ARTIFACT_CROWNSTORMWIND.setStatus(ARTIFACT_STATUS_HIDDEN)
    call ARTIFACT_CROWNSTORMWIND.setDescription("Melted down")
    call SetPlayerTechResearched(whichFaction.Person.p, RESEARCH_ID, 1)
    call DisplayResearchAcquired(whichFaction.Person.p, RESEARCH_ID, 1)
  endfunction

  private function IsCompleteStormwind takes nothing returns boolean
    return FACTION_STORMWIND.getQuestItemProgress(QUESTITEM_STORMWIND_CAPTURE_CAPITALPALACE) == QUEST_PROGRESS_COMPLETE and FACTION_STORMWIND.getQuestItemProgress(QUESTITEM_STORMWIND_CROWNLORDAERON) == QUEST_PROGRESS_COMPLETE and FACTION_STORMWIND.getQuestItemProgress(QUESTITEM_STORMWIND_CROWNSTORMWIND) == QUEST_PROGRESS_COMPLETE and FACTION_STORMWIND.getQuestItemProgress(QUESTITEM_STORMWIND_VARIAN) == QUEST_PROGRESS_COMPLETE 
  endfunction
  
  private function IsCompleteLordaeron takes nothing returns boolean
    return FACTION_LORDAERON.getQuestItemProgress(QUESTITEM_LORDAERON_CAPTURE_STORMWIND) == QUEST_PROGRESS_COMPLETE and FACTION_LORDAERON.getQuestItemProgress(QUESTITEM_LORDAERON_CROWNLORDAERON) == QUEST_PROGRESS_COMPLETE and FACTION_LORDAERON.getQuestItemProgress(QUESTITEM_LORDAERON_CROWNSTORMWIND) == QUEST_PROGRESS_COMPLETE and FACTION_LORDAERON.getQuestItemProgress(QUESTITEM_LORDAERON_ARTHAS) == QUEST_PROGRESS_COMPLETE 
  endfunction

  private function TryComplete takes Faction whichFaction returns nothing
    if not RewardedLordaeron and not RewardedStormwind then
      if whichFaction == FACTION_LORDAERON and IsCompleteLordaeron() then
        call Reward(FACTION_LORDAERON)
      elseif whichFaction == FACTION_STORMWIND and IsCompleteStormwind() then
        call Reward(FACTION_STORMWIND)
      endif
    endif
  endfunction

  private function OnLegendChangesOwner takes nothing returns nothing
    if not IsCompleteLordaeron() then
      if LEGEND_ARTHAS.OwningFaction == FACTION_LORDAERON then
        call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_LORDAERON_ARTHAS, QUEST_PROGRESS_COMPLETE, true)
        call TryComplete(FACTION_LORDAERON)
      else
        call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_LORDAERON_ARTHAS, QUEST_PROGRESS_FAILED, false)
      endif
    endif

    if not IsCompleteStormwind() then
      if LEGEND_VARIAN.OwningFaction == FACTION_STORMWIND then
        call FACTION_STORMWIND.setQuestItemProgress(QUESTITEM_STORMWIND_VARIAN, QUEST_PROGRESS_COMPLETE, true)
        call TryComplete(FACTION_STORMWIND)
      else
        call FACTION_STORMWIND.setQuestItemProgress(QUESTITEM_STORMWIND_VARIAN, QUEST_PROGRESS_FAILED, false)
      endif
    endif
  endfunction

  private function Acquire takes nothing returns nothing
    if not IsCompleteLordaeron() then
      if ARTIFACT_CROWNLORDAERON.owningPerson.Faction == FACTION_LORDAERON then
        call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_LORDAERON_CROWNLORDAERON, QUEST_PROGRESS_COMPLETE, true)
        call TryComplete(FACTION_LORDAERON)
      else
        call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_LORDAERON_CROWNLORDAERON, QUEST_PROGRESS_INCOMPLETE, true)
      endif

      if ARTIFACT_CROWNSTORMWIND.owningPerson.Faction == FACTION_LORDAERON then
        call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_LORDAERON_CROWNSTORMWIND, QUEST_PROGRESS_COMPLETE, true)
        call TryComplete(FACTION_LORDAERON)
      else
        call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_LORDAERON_CROWNSTORMWIND, QUEST_PROGRESS_INCOMPLETE, true)
      endif
    endif

    if not IsCompleteStormwind() then
      if ARTIFACT_CROWNLORDAERON.owningPerson.Faction == FACTION_STORMWIND then
        call FACTION_STORMWIND.setQuestItemProgress(QUESTITEM_STORMWIND_CROWNLORDAERON, QUEST_PROGRESS_COMPLETE, true)
        call TryComplete(FACTION_STORMWIND)
      else
        call FACTION_STORMWIND.setQuestItemProgress(QUESTITEM_STORMWIND_CROWNLORDAERON, QUEST_PROGRESS_INCOMPLETE, true)
      endif

      if ARTIFACT_CROWNSTORMWIND.owningPerson.Faction == FACTION_STORMWIND then
        call FACTION_STORMWIND.setQuestItemProgress(QUESTITEM_STORMWIND_CROWNSTORMWIND, QUEST_PROGRESS_COMPLETE, true)
        call TryComplete(FACTION_STORMWIND)
      else
        call FACTION_STORMWIND.setQuestItemProgress(QUESTITEM_STORMWIND_CROWNSTORMWIND, QUEST_PROGRESS_INCOMPLETE, true)
      endif
    endif
  endfunction

  private function Capture takes nothing returns nothing
    if not IsCompleteLordaeron() then
      if GetUnitTypeId(GetTriggerControlPoint().u) == 'n010' and FACTION_LORDAERON.Person.Team.containsPlayer(GetOwningPlayer(GetTriggerControlPoint().u)) then
        call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_LORDAERON_CAPTURE_STORMWIND, QUEST_PROGRESS_COMPLETE, true)
        call TryComplete(FACTION_LORDAERON)
      else
        call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_LORDAERON_CAPTURE_STORMWIND, QUEST_PROGRESS_INCOMPLETE, true)
      endif
    endif

    if not IsCompleteStormwind() then
      if GetUnitTypeId(GetTriggerControlPoint().u) == 'n01G' and FACTION_STORMWIND.Person.Team.containsPlayer(GetOwningPlayer(GetTriggerControlPoint().u)) then
        call FACTION_STORMWIND.setQuestItemProgress(QUESTITEM_STORMWIND_CAPTURE_CAPITALPALACE, QUEST_PROGRESS_COMPLETE, true)
        call TryComplete(FACTION_STORMWIND)
      else
        call FACTION_STORMWIND.setQuestItemProgress(QUESTITEM_STORMWIND_CAPTURE_CAPITALPALACE, QUEST_PROGRESS_INCOMPLETE, true)
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local QuestData tempQuest
    local trigger trig

    set tempQuest = QuestData.create("Kingdom of Man", "Before the First War, all of humanity was united under the banner of the Arathorian Empire. Reclaim its greatness by uniting mankind once again.", "The people of the Eastern Kingdoms have been united under the banner of Lordaeron. Long live the King.", "ReplaceableTextures\\CommandButtons\\BTNFireKingCrown.blp")
    set tempQuest.Global = true
    set QUESTITEM_LORDAERON_CAPTURE_STORMWIND = tempQuest.addItem("Capture the Stormwind Control Point")
    set QUESTITEM_LORDAERON_CROWNLORDAERON = tempQuest.addItem("Acquire the Crown of Lordaeron")
    set QUESTITEM_LORDAERON_CROWNSTORMWIND = tempQuest.addItem("Acquire the Crown of Stormwind")
    set QUESTITEM_LORDAERON_ARTHAS = tempQuest.addItem("Arthas must survive")
    call FACTION_LORDAERON.addQuest(tempQuest)
    call FACTION_LORDAERON.modObjectLimit(RESEARCH_ID, UNLIMITED)
    call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_LORDAERON_ARTHAS, QUEST_PROGRESS_COMPLETE, false)
    call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_LORDAERON_CROWNLORDAERON, QUEST_PROGRESS_COMPLETE, false)

    set tempQuest = QuestData.create("Kingdom of Man", "Before the First War, all of humanity was united under the banner of the Arathorian Empire. Reclaim its greatness by uniting mankind once again.", "The people of the Eastern Kingdoms have been united under the banner of Stormwind. Long live the King.", "ReplaceableTextures\\CommandButtons\\BTNFireKingCrown.blp")
    set tempQuest.Global = true
    set QUESTITEM_STORMWIND_CAPTURE_CAPITALPALACE = tempQuest.addItem("Capture the Capital Palace Control Point")
    set QUESTITEM_STORMWIND_CROWNLORDAERON = tempQuest.addItem("Acquire the Crown of Lordaeron")
    set QUESTITEM_STORMWIND_CROWNSTORMWIND = tempQuest.addItem("Acquire the Crown of Stormwind")
    set QUESTITEM_STORMWIND_VARIAN = tempQuest.addItem("Varian must survive")
    call FACTION_STORMWIND.addQuest(tempQuest)
    call FACTION_STORMWIND.modObjectLimit(RESEARCH_ID, UNLIMITED)
    call FACTION_STORMWIND.setQuestItemProgress(QUESTITEM_STORMWIND_VARIAN, QUEST_PROGRESS_COMPLETE, false)
    call FACTION_STORMWIND.setQuestItemProgress(QUESTITEM_STORMWIND_CROWNSTORMWIND, QUEST_PROGRESS_COMPLETE, false)

    set trig = CreateTrigger()
    call OnControlPointOwnerChange.register(trig)
    call TriggerAddAction(trig, function Capture)

    set trig = CreateTrigger()
    call OnArtifactOwnerChange.register(trig)
    call TriggerAddAction(trig, function Acquire)

    set trig = CreateTrigger()
    call OnLegendChangeOwner.register(trig)
    call TriggerAddAction(trig, function OnLegendChangesOwner)
  endfunction

endlibrary