library QuestSapphiron initializer OnInit requires QuestData, ScourgeConfig

  globals
    private constant integer SAPPHIRON_ID = 'ubdd'
    private constant integer SAPPHIRON_RESEARCH = 'R025'

    private QuestData QUEST_SAPPHIRON
    private QuestItemData QUESTITEM_SAPPHIRON
  endglobals

  private function SapphironDies takes nothing returns nothing
    local Person triggerPerson = Persons[GetPlayerId(GetOwningPlayer(GetKillingUnit()))]
    local Person scourgePerson = PersonsByFaction[FACTION_SCOURGE]
    if triggerPerson.team.containsPlayer(scourgePerson.p) then
      call CreateUnit(scourgePerson.p, SAPPHIRON_ID, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()), GetUnitFacing(GetTriggerUnit()))
      call SetPlayerTechResearched(scourgePerson.p, SAPPHIRON_RESEARCH, 1)
      call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_SAPPHIRON, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_SAPPHIRON, QUEST_PROGRESS_FAILED, true)
    endif
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterUnitEvent(trig, gg_unit_ubdr_0668, EVENT_UNIT_DEATH)
    call TriggerAddAction(trig, function SapphironDies)

    set QUEST_SAPPHIRON = QuestData.create("Sapphiron", "Kill Sapphiron the Blue Dragon to reanimate her as a Frost Wyrm. Sapphiron can be found in Northrend.", "Sapphiron has been slain, and has been reanimated as a mighty Frost Worm under the command of the Scourge.", "ReplaceableTextures\\CommandButtons\\BTNFrostWyrm.blp")
    set QUESTITEM_SAPPHIRON = QUEST_SAPPHIRON.addItem("Kill Sapphiron")
    call FACTION_SCOURGE.addQuest(QUEST_SAPPHIRON)
  endfunction

endlibrary