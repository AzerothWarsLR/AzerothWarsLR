library QuestVaultoftheWardens initializer OnInit requires QuestData, SentinelsConfig, NightElfConfig, SoloSentinelsConfig

  globals
    private QuestData QUEST_VAULT
    private QuestItemData QUESTITEM_CAPTUREOUTSIDE
    private QuestItemData QUESTITEM_CAPTUREINSIDE

    private boolean Finished = false
  endglobals

  private function TryComplete takes nothing returns nothing
    local Person sentinelsPerson = FACTION_SENTINELS.whichPerson
    local unit vault
    if sentinelsPerson == 0 then
      set sentinelsPerson = FACTION_SOLO_SENTINELS.whichPerson
    endif
    if sentinelsPerson == 0 then
      set sentinelsPerson = FACTION_NIGHT_ELVES.whichPerson
    endif
    if GetOwningPlayer(gg_unit_n05Y_0805) == sentinelsPerson.p and GetOwningPlayer(gg_unit_n00J_3344) == sentinelsPerson.p then
      set Finished = true
      set vault = CreateUnit(sentinelsPerson.p, 'n04G', GetRectCenterX(gg_rct_VaultoftheWardens), GetRectCenterY(gg_rct_VaultoftheWardens), 220)
      call UnitRescue(vault, sentinelsPerson.p)
      set vault = null
    endif
  endfunction

  private function TombChangesOwnership takes nothing returns nothing
    local Person capturePerson = Persons[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]
    if not Finished then
      if capturePerson.faction == FACTION_SENTINELS or capturePerson.faction == FACTION_SOLO_SENTINELS or capturePerson.faction == FACTION_NIGHT_ELVES then
        call TryComplete()
        call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_CAPTUREINSIDE, QUEST_PROGRESS_COMPLETE, true)
        call FACTION_SOLO_SENTINELS.setQuestItemStatus(QUESTITEM_CAPTUREINSIDE, QUEST_PROGRESS_COMPLETE, true)
        call FACTION_NIGHT_ELVES.setQuestItemStatus(QUESTITEM_CAPTUREINSIDE, QUEST_PROGRESS_COMPLETE, true)
      else
        call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_CAPTUREINSIDE, QUEST_PROGRESS_INCOMPLETE, false)
        call FACTION_SOLO_SENTINELS.setQuestItemStatus(QUESTITEM_CAPTUREINSIDE, QUEST_PROGRESS_INCOMPLETE, false)
        call FACTION_NIGHT_ELVES.setQuestItemStatus(QUESTITEM_CAPTUREINSIDE, QUEST_PROGRESS_INCOMPLETE, false)
      endif
    endif
  endfunction

  private function IslesChangesOwnership takes nothing returns nothing
    local Person capturePerson = Persons[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]
    if not Finished then
      if capturePerson.faction == FACTION_SENTINELS or capturePerson.faction == FACTION_SOLO_SENTINELS or capturePerson.faction == FACTION_NIGHT_ELVES then
        call TryComplete()
        call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_CAPTUREOUTSIDE, QUEST_PROGRESS_COMPLETE, true)
        call FACTION_SOLO_SENTINELS.setQuestItemStatus(QUESTITEM_CAPTUREOUTSIDE, QUEST_PROGRESS_COMPLETE, true)
        call FACTION_NIGHT_ELVES.setQuestItemStatus(QUESTITEM_CAPTUREOUTSIDE, QUEST_PROGRESS_COMPLETE, true)
      else
        call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_CAPTUREOUTSIDE, QUEST_PROGRESS_INCOMPLETE, false)
        call FACTION_SOLO_SENTINELS.setQuestItemStatus(QUESTITEM_CAPTUREOUTSIDE, QUEST_PROGRESS_INCOMPLETE, false)
        call FACTION_NIGHT_ELVES.setQuestItemStatus(QUESTITEM_CAPTUREOUTSIDE, QUEST_PROGRESS_INCOMPLETE, false)
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    local integer i = 0
    local unit u = null

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_n05Y_0805, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction(trig, function IslesChangesOwnership)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_n00J_3344, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction(trig, function TombChangesOwnership)

    //Quest setup
    set QUEST_VAULT = QuestData.create("Vault of the Wardens", "In millenia past, the most vile entities of Azeroth were imprisoned in a facility near Zin-Ashari. The Broken Isles, now raised from the sea floor, would be a strategic location for a newer edition of such a prison.", "With the Broken Isles and the Tomb of Sargeras secured, work has begun on a maximum security prison named the Vault of the Wardens.", "ReplaceableTextures\\CommandButtons\\BTNReincarnationWarden.blp")
    set QUESTITEM_CAPTUREOUTSIDE = QUEST_VAULT.addItem("Capture the Broken Isles")
    set QUESTITEM_CAPTUREINSIDE = QUEST_VAULT.addItem("Capture the Tomb of Sargeras")
    call FACTION_SENTINELS.addQuest(QUEST_VAULT)
    call FACTION_SOLO_SENTINELS.addQuest(QUEST_VAULT)
    call FACTION_NIGHT_ELVES.addQuest(QUEST_VAULT)
  endfunction

endlibrary