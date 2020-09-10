library QuestCorruptArthas initializer OnInit requires Persons, GameTimer, GeneralHelpers, LegionConfig, ScourgeConfig, DetermineLevel

  globals
    private QuestData QUEST_REANIMATE_ARTHAS
    private QuestItemData QUESTITEM_DESTROY_STRATHOLME
    private QuestItemData QUESTITEM_DESTROY_TYRSHAND
    private QuestItemData QUESTITEM_DESTROY_CAPITAL_PALACE
  endglobals

  private function AnyCapitalDies takes nothing returns nothing
    if not IsUnitAliveBJ(gg_unit_h000_0406) and not IsUnitAliveBJ(gg_unit_h01G_0885) and not IsUnitAliveBJ(gg_unit_h030_0839) then
      if FACTION_SCOURGE.Person != 0 then
        set LEGEND_ARTHAS.UnitType = 'Uear'
        call UnitDropAllItems(LEGEND_ARTHAS.Unit)
        call LEGEND_ARTHAS.Spawn(FACTION_SCOURGE.Player, GetRectCenterX(gg_rct_LichKing), GetRectCenterY(gg_rct_LichKing), 135)
        call UnitDetermineLevel(LEGEND_ARTHAS.Unit, 1.00)
      endif
      call FACTION_SCOURGE.setQuestItemProgress(QuestLichKingArthas_QUESTITEM_LICHKINGARTHAS_GETARTHAS, QUEST_PROGRESS_COMPLETE, true)
    endif
  endfunction

  private function StratholmeDies takes nothing returns nothing
    call FACTION_SCOURGE.setQuestItemProgress(QUESTITEM_DESTROY_STRATHOLME, QUEST_PROGRESS_COMPLETE, true)
    call AnyCapitalDies()
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function TyrsHandDies takes nothing returns nothing
    call FACTION_SCOURGE.setQuestItemProgress(QUESTITEM_DESTROY_TYRSHAND, QUEST_PROGRESS_COMPLETE, true)
    call AnyCapitalDies()
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function CapitalPalaceDies takes nothing returns nothing
    call FACTION_SCOURGE.setQuestItemProgress(QUESTITEM_DESTROY_CAPITAL_PALACE, QUEST_PROGRESS_COMPLETE, true)
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