library QuestVaultoftheWardens initializer OnInit requires QuestData, SentinelsConfig

  globals
    private QuestData QUEST_VAULT
    private QuestItemData QUESTITEM_CAPTUREOUTSIDE
    private QuestItemData QUESTITEM_CAPTUREINSIDE
  endglobals

  private function TryComplete takes nothing returns nothing
    if FACTION_SENTINELS.getQuestItemProgress(QUESTITEM_CAPTUREINSIDE) == QUEST_PROGRESS_COMPLETE and FACTION_SENTINELS.getQuestItemProgress(QUESTITEM_CAPTUREOUTSIDE) == QUEST_PROGRESS_COMPLETE then
      call CreateUnit(FACTION_SENTINELS.Person.p, 'n04G', GetRectCenterX(gg_rct_VaultoftheWardens), GetRectCenterY(gg_rct_VaultoftheWardens), 220)
    endif
  endfunction

  private function TombChangesOwnership takes nothing returns nothing
    if FACTION_SENTINELS.getQuestItemProgress(QUESTITEM_CAPTUREINSIDE) == QUEST_PROGRESS_INCOMPLETE and FACTION_SENTINELS.Person.p == GetOwningPlayer(GetTriggerUnit()) then
      call TryComplete()
      call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_CAPTUREINSIDE, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_CAPTUREINSIDE, QUEST_PROGRESS_INCOMPLETE, false)
    endif
  endfunction

  private function IslesChangesOwnership takes nothing returns nothing
    if FACTION_SENTINELS.getQuestItemProgress(QUESTITEM_CAPTUREOUTSIDE) == QUEST_PROGRESS_INCOMPLETE and FACTION_SENTINELS.Person.p == GetOwningPlayer(GetTriggerUnit()) then
      call TryComplete()
      call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_CAPTUREOUTSIDE, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_CAPTUREOUTSIDE, QUEST_PROGRESS_INCOMPLETE, false)
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
  endfunction

endlibrary