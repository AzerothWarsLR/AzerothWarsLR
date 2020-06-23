library QuestSummonLegion initializer OnInit requires QuestData, ScourgeConfig, LegionConfig

  globals
    private QuestData QUEST_SCOURGESUMMONLEGION
    private QuestItemData QUESTITEM_SCOURGEALLYLEGION
    private QuestItemData QUESTITEM_SCOURGESUMMONLEGION

    private QuestData QUEST_LEGIONSUMMONLEGION
    private QuestItemData QUESTITEM_LEGIONSUMMONLEGION

    private constant integer RITUAL_ID = 'A00J'
  endglobals

  private function CheckAlliance takes nothing returns nothing
    if FACTION_SCOURGE.whichPerson.team.containsPlayer(FACTION_LEGION.whichPerson.p) then
      call QUESTITEM_SCOURGEALLYLEGION.setProgress(QUEST_PROGRESS_COMPLETE, false)
    else
      call QUESTITEM_SCOURGEALLYLEGION.setProgress(QUEST_PROGRESS_FAILED, false)
    endif
  endfunction

  private function Cast takes nothing returns nothing
    if GetSpellAbilityId() == RITUAL_ID then
      call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_SCOURGESUMMONLEGION, QUEST_PROGRESS_COMPLETE, false) //Not needed because they can see the global completion
      call FACTION_LEGION.setQuestItemStatus(QUESTITEM_LEGIONSUMMONLEGION, QUEST_PROGRESS_COMPLETE, true)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()

    set QUEST_SCOURGESUMMONLEGION = QuestData.create("Under the Burning Sky", "The Scourge was created for one purpose only: to summon the full might of the Burning Legion into Azeroth. Retrieve the Book of Medivh from Dalaran, or empower Kel'thuzad in the waters of the Sunwell, and then begin the summoning ritual.", "Tremble, mortals, and despair. Doom has come to this world.", "ReplaceableTextures\\CommandButtons\\BTNArchimonde.blp")
    set QUESTITEM_SCOURGEALLYLEGION = QUEST_SCOURGESUMMONLEGION.addItem("Ally the Burning Legion")
    set QUESTITEM_SCOURGESUMMONLEGION = QUEST_SCOURGESUMMONLEGION.addItem("Summon the Burning Legion")
    call FACTION_SCOURGE.addQuest(QUEST_SCOURGESUMMONLEGION)

    set QUEST_LEGIONSUMMONLEGION = QuestData.create("Under the Burning Sky", "The greater forces of the Burning Legion lie in wait in the vast expanse of the Twisting Nether. Use the Book of Medivh to tear open a hole in space-time, and visit the full might of the Legion upon Azeroth.", "Tremble, mortals, and despair. Doom has come to this world.", "ReplaceableTextures\\CommandButtons\\BTNArchimonde.blp")
    set QUEST_LEGIONSUMMONLEGION.Global = true
    set QUESTITEM_LEGIONSUMMONLEGION = QUEST_LEGIONSUMMONLEGION.addItem("Summon the Burning Legion")
    call FACTION_LEGION.addQuest(QUEST_LEGIONSUMMONLEGION)
    set FACTION_LEGION.StartingQuest = QUEST_LEGIONSUMMONLEGION

    call OnPersonTeamJoin.register(trig)
    call OnPersonTeamLeave.register(trig)
    call OnPersonFactionChange.register(trig)
    call TriggerAddAction(trig, function CheckAlliance)

    set trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddAction(trig, function Cast)
  endfunction

endlibrary