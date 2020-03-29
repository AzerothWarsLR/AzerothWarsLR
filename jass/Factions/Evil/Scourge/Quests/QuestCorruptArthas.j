library QuestCorruptArthas initializer OnInit requires Persons, GameTimer, GeneralHelpers, LegionConfig, ScourgeConfig, DetermineLevel, MalganisModConfig

  globals
    private QuestData QUEST_REANIMATE_ARTHAS
    private QuestItemData QUESTITEM_DESTROY_STRATHOLME
    private QuestItemData QUESTITEM_DESTROY_TYRSHAND
    private QuestItemData QUESTITEM_DESTROY_CAPITAL_PALACE

    private unit UNIT_MALGANIS = null
  endglobals

  private function CorruptArthas takes nothing returns nothing
    local Person scourge = PersonsByFaction[FACTION_SCOURGE]
    local Person legion = PersonsByFaction[FACTION_LEGION]
    local unit malganis = null
    local group tempGroup = null
    if scourge != 0 then
      set LEGEND_ARTHAS.UnitType = 'Uear'
      call UnitDropAllItems(LEGEND_ARTHAS.Unit)
      call LEGEND_ARTHAS.Spawn(FACTION_SCOURGE.whichPerson.p, GetRectCenterX(gg_rct_LichKing), GetRectCenterY(gg_rct_LichKing), 135)
      call UnitDetermineLevel(LEGEND_ARTHAS.Unit, 1.00)
      call FACTION_LEGION.applyFactionMod(FACTIONMOD_MALGANIS)
      if legion != 0 then
        set tempGroup = CreateGroup()
        call GroupEnumUnitsOfType(tempGroup, "Mal'Ganis", null)
        set malganis = GroupPickRandomUnit(tempGroup)
        call UnitTransferItems(malganis, LEGEND_ARTHAS.Unit)
        call RemoveUnit(malganis)
        //cleanup
        set malganis = null
        call DestroyGroup(tempGroup)
        set tempGroup = null
      endif
    endif
    call FACTION_SCOURGE.setQuestItemStatus(QuestLichKingArthas_QUESTITEM_LICHKINGARTHAS_GETARTHAS, QUEST_PROGRESS_COMPLETE, true)
  endfunction

  private function AnyCapitalDies takes nothing returns nothing
    if not IsUnitAliveBJ(gg_unit_h000_0406) and not IsUnitAliveBJ(gg_unit_h01G_0885) and not IsUnitAliveBJ(gg_unit_h030_0839) then
      call CorruptArthas()
    endif
  endfunction

  private function StratholmeDies takes nothing returns nothing
    call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_DESTROY_STRATHOLME, QUEST_PROGRESS_COMPLETE, true)
    call AnyCapitalDies()
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function TyrsHandDies takes nothing returns nothing
    call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_DESTROY_TYRSHAND, QUEST_PROGRESS_COMPLETE, true)
    call AnyCapitalDies()
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function CapitalPalaceDies takes nothing returns nothing
    call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_DESTROY_CAPITAL_PALACE, QUEST_PROGRESS_COMPLETE, true)
    call AnyCapitalDies()
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    set QUEST_REANIMATE_ARTHAS = QuestData.create("The Culling", "When the last bastion of Lordaeron falls, Prince Arthas will abandon his people and join the Scourge as their champion.", "Having failed to protect his people, Arthas seizes the cursed runeblade Frostmourne as the instrument of his vengeance. The malevolence of the blade overwhelms him. Arthas is now a loyal Death Knight of the Scourge, and will soon become its greatest champion.", "ReplaceableTextures\\CommandButtons\\BTNHeroDeathKnight.blp")
    set QUESTITEM_DESTROY_STRATHOLME = QUEST_REANIMATE_ARTHAS.addItem("Destroy Stratholme")
    set QUESTITEM_DESTROY_TYRSHAND = QUEST_REANIMATE_ARTHAS.addItem("Destroy Tyr's Hand")
    set QUESTITEM_DESTROY_CAPITAL_PALACE = QUEST_REANIMATE_ARTHAS.addItem("Destroy Capital Palace")
    call FACTION_SCOURGE.addQuest(QUEST_REANIMATE_ARTHAS) 

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_h000_0406, EVENT_UNIT_DEATH )  //Capital Palace
    call TriggerAddAction(trig, function CapitalPalaceDies)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_h01G_0885, EVENT_UNIT_DEATH )  //Stratholme
    call TriggerAddAction(trig, function StratholmeDies)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_h030_0839, EVENT_UNIT_DEATH )  //Tyr's Hand Citadel
    call TriggerAddAction(trig, function TyrsHandDies)
  endfunction
    
endlibrary