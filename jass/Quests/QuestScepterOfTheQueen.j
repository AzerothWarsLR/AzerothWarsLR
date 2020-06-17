library QuestScepterOfTheQueen initializer OnInit requires QuestData, Environment, FrostwolfConfig, WarsongConfig, SentinelsConfig, DruidsConfig, ArtifactConfig

  globals
    private QuestData QUEST_SCEPTER_HORDE
    private QuestItemData QUESTITEM_KILL_FEATHERMOON
    private QuestItemData QUESTITEM_VISIT_HORDE

    private QuestData QUEST_SCEPTER_NE
    private QuestItemData QUESTITEM_KILL_STONEMAUL
    private QuestItemData QUESTITEM_VISIT_NE
  endglobals

  private function EntersRegion takes nothing returns nothing
    if FACTION_SENTINELS.Person.Team.containsPlayer(GetOwningPlayer(GetTriggerUnit())) and FACTION_SENTINELS.getQuestItemProgress(QUESTITEM_KILL_STONEMAUL) == QUEST_PROGRESS_COMPLETE and FACTION_SENTINELS.getQuestItemProgress(QUESTITEM_VISIT_NE) != QUEST_PROGRESS_COMPLETE then
      call SetItemPosition(ARTIFACT_SCEPTEROFTHEQUEEN.item, GetRectCenterX(gg_rct_HighBourne), GetRectCenterY(gg_rct_HighBourne))
      call RescueNeutralUnitsInRect(gg_rct_HighBourne, FACTION_SENTINELS.Person.p)
      call FACTION_SENTINELS.setQuestItemProgress(QUESTITEM_VISIT_NE, QUEST_PROGRESS_COMPLETE, true)
      call FACTION_WARSONG.setQuestItemProgress(QUESTITEM_VISIT_HORDE, QUEST_PROGRESS_FAILED, true)
    elseif FACTION_WARSONG.Person.Team.containsPlayer(GetOwningPlayer(GetTriggerUnit())) and FACTION_WARSONG.getQuestItemProgress(QUESTITEM_KILL_FEATHERMOON) == QUEST_PROGRESS_COMPLETE and FACTION_WARSONG.getQuestItemProgress(QUESTITEM_VISIT_HORDE) != QUEST_PROGRESS_COMPLETE then
      call SetItemPosition(ARTIFACT_SCEPTEROFTHEQUEEN.item, GetRectCenterX(gg_rct_HighBourne), GetRectCenterY(gg_rct_HighBourne))
      call RescueNeutralUnitsInRect(gg_rct_HighBourne, Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call FACTION_WARSONG.setQuestItemProgress(QUESTITEM_VISIT_HORDE, QUEST_PROGRESS_COMPLETE, true)
      call FACTION_SENTINELS.setQuestItemProgress(QUESTITEM_VISIT_NE, QUEST_PROGRESS_FAILED, true)
    endif
  endfunction

  private function StonemaulDies takes nothing returns nothing
    call FACTION_SENTINELS.setQuestItemProgress(QUESTITEM_KILL_STONEMAUL, QUEST_PROGRESS_COMPLETE, true)
  endfunction

  private function FeathermoonDies takes nothing returns nothing
    call FACTION_WARSONG.setQuestItemProgress(QUESTITEM_KILL_FEATHERMOON, QUEST_PROGRESS_COMPLETE, true)
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    local integer i
    local group tempGroup
    local unit u

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_o004_0169, EVENT_UNIT_DEATH )
    call TriggerAddAction( trig, function StonemaulDies )

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_e00M_2545, EVENT_UNIT_DEATH )
    call TriggerAddAction( trig, function FeathermoonDies )

    set trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple( trig, gg_rct_HighBourne )
    call TriggerAddAction( trig, function EntersRegion )

    //Horde quest setup
    set QUEST_SCEPTER_HORDE = QuestData.create("Royal Plunder", "Remnants of the ancient Highborne survive within the ruins of Dire Maul. If Feathermoon Stronghold falls, it would become a simple matter to slaughter the Highborne and plunder their artifacts.", "The Highborne are no longer implicitly defended by the Night Elven presence at Feathermoon Stronghold. The Horde unleashes their full might against these Night Elven arcanists.", "ReplaceableTextures\\CommandButtons\\BTNNagaWeaponUp2.blp")
    set QUESTITEM_KILL_FEATHERMOON = QUEST_SCEPTER_HORDE.addItem("Destroy Feathermoon Stronghold")
    set QUESTITEM_VISIT_HORDE = QUEST_SCEPTER_HORDE.addItem("Bring a unit to Eldre'thalas")
    call FACTION_WARSONG.addQuest(QUEST_SCEPTER_HORDE)

    //Night elf quest setup
    set QUEST_SCEPTER_NE = QuestData.create("Return to the Fold", "Remnants of the ancient Highborne survive within the ruins of Dire Maul. If Stonemaul falls, it would be safe for them to come out.", "The Shen'dralar, the Highborne survivors of the Sundering, swear allegiance to their fellow Night Elves. As a sign of their loyalty, they offer up an artifact they have guarded for thousands of years: the Scepter of the Queen.", "ReplaceableTextures\\CommandButtons\\BTNNagaWeaponUp2.blp")
    set QUESTITEM_KILL_STONEMAUL = QUEST_SCEPTER_NE.addItem("Destroy Stonemaul Keep")
    set QUESTITEM_VISIT_NE = QUEST_SCEPTER_NE.addItem("Bring a unit to Eldre'thalas")
    call FACTION_SENTINELS.addQuest(QUEST_SCEPTER_NE)

    //Make the Shen'dralar starting units invulnerable
    set tempGroup = CreateGroup()
    call GroupEnumUnitsInRect(tempGroup, gg_rct_HighBourne, null)
    loop
      set u = FirstOfGroup(tempGroup)
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call SetUnitInvulnerable(u, true)
      endif
      call GroupRemoveUnit(tempGroup, u)
      exitwhen u == null
    endloop
  endfunction

endlibrary