library QuestT2FelHorde initializer OnInit requires QuestData, FelHordeConfig

  globals
    private QuestData QUEST
    private QuestItemData QUESTITEM_KILLSTORMWIND
    private QuestItemData QUESTITEM_KILLIRONFORGE

    private integer RESEARCH = 'R05Z'

  endglobals

  private function TryComplete takes nothing returns nothing
    if not UnitAlive(gg_unit_h001_0180) and not UnitAlive(gg_unit_h00X_0007) then
      call SetPlayerTechResearched(FACTION_FEL_HORDE.Player, RESEARCH, 1)
    endif
  endfunction

  private function StormwindDies takes nothing returns nothing
    call FACTION_FEL_HORDE.setQuestItemProgress(QUESTITEM_KILLSTORMWIND, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction

  private function IronforgeDies takes nothing returns nothing
    call FACTION_FEL_HORDE.setQuestItemProgress(QUESTITEM_KILLIRONFORGE, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction


    //Capital death setup
    private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_h001_0180, EVENT_UNIT_DEATH )  //Ironforge
    call TriggerAddAction(trig, function IronforgeDies)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_h00X_0007, EVENT_UNIT_DEATH )  //Stormwind
    call TriggerAddAction(trig, function StormwindDies)


    set QUEST = QuestData.create("Savage Negotations", "Diplomatic negotations amongst the Fel Orcish clans are prolonged, deadly engagements. Only the destruction of Stormwind and Ironforge will truly rally the clans, for it would signal the beginning of Magtheridon's ultimate invasion.", "The sheer brutality of Magtheridon's conquest has reached the ears of each of the Fel Horde clans. The Shadowmoon Clan and the Dragonmaw Clan offer up their allegiances, demanding participation in the coming bloodshed.", "ReplaceableTextures\\CommandButtons\\BTNChaosGrunt.blp")
    set QUESTITEM_KILLSTORMWIND = QUEST.addItem("Destroy Stormwind Keep")
    set QUESTITEM_KILLIRONFORGE = QUEST.addItem("Destroy Great Forge")
    call FACTION_FEL_HORDE.addQuest(QUEST)
  endfunction

endlibrary