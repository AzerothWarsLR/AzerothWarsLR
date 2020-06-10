//Prince Arthas goes to the Frozen Throne after it's destroyed. He becomes King Arthas, gets the Crown of Lordaeron, and Terenas dies.
library QuestKingArthas initializer OnInit requires QuestData, Artifact, GeneralHelpers, LordaeronConfig
  globals
    private constant integer CROWN_ID = 'I001'
    private QuestData QUEST_KINGARTHAS
    public QuestItemData QUESTITEM_KINGARTHAS_PROTECT
    private QuestItemData QUESTITEM_KINGARTHAS_DESTROY
    private QuestItemData QUESTITEM_KINGARTHAS_VISIT
  endglobals

  private function EntersRegion takes nothing returns nothing
    local unit triggerUnit = GetTriggerUnit()

    if triggerUnit == LEGEND_ARTHAS.Unit and LEGEND_ARTHAS.OwningFaction == FACTION_LORDAERON and FACTION_LORDAERON.getQuestItemProgress(QUESTITEM_KINGARTHAS_VISIT) == QUEST_PROGRESS_INCOMPLETE and FACTION_LORDAERON.getQuestItemProgress(QUESTITEM_KINGARTHAS_DESTROY) == QUEST_PROGRESS_COMPLETE and FACTION_LORDAERON.getQuestItemProgress(QUESTITEM_KINGARTHAS_PROTECT) == QUEST_PROGRESS_COMPLETE then
      set LEGEND_ARTHAS.UnitType = 'Harf'
      if ARTIFACT_CROWNLORDAERON.owningPerson == FACTION_LORDAERON.Person then
        call SetItemPosition(ARTIFACT_CROWNLORDAERON.item, GetUnitX(LEGEND_ARTHAS.Unit), GetUnitY(LEGEND_ARTHAS.Unit))
        call UnitAddItem(LEGEND_ARTHAS.Unit, ARTIFACT_CROWNLORDAERON.item)
      endif
      call FACTION_LORDAERON.setQuestItemStatus(QUESTITEM_KINGARTHAS_VISIT, QUEST_PROGRESS_COMPLETE, true) 
      call KillUnit(gg_unit_nemi_0019)  //King Terenas
      call DestroyTrigger(GetTriggeringTrigger())
    endif

    set triggerUnit = null
  endfunction    

  private function FrozenThroneDies takes nothing returns nothing
    call FACTION_LORDAERON.setQuestItemStatus(QUESTITEM_KINGARTHAS_DESTROY, QUEST_PROGRESS_COMPLETE, true)
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple( trig, gg_rct_LichKing )
    call TriggerAddCondition( trig, Condition( function EntersRegion ) )  

    set QUEST_KINGARTHAS = QuestData.create("The Crown Prince", "Arthas Menethil is the one true heir of the Kingdom of Lordaeron. The only thing standing in the way of his coronation is the world-ending threat of the Scourge.", "With the Lich King eliminated, the Kingdom of Lordaeron is free of its greatest threat. King Terenas Menethil passes peacefully into the night, and Arthas is crowned the new King.", "ReplaceableTextures\\CommandButtons\\BTNArthas.blp")
    set QUESTITEM_KINGARTHAS_PROTECT = QUEST_KINGARTHAS.addItem("Arthas must not betray Lordaeron")
    set QUESTITEM_KINGARTHAS_DESTROY = QUEST_KINGARTHAS.addItem("Destroy the Frozen Throne")
    set QUESTITEM_KINGARTHAS_VISIT = QUEST_KINGARTHAS.addItem("Bring Arthas to the Frozen Throne")
    call FACTION_LORDAERON.addQuest(QUEST_KINGARTHAS) 
    call FACTION_LORDAERON.setQuestItemStatus(QUESTITEM_KINGARTHAS_PROTECT, QUEST_PROGRESS_COMPLETE, false)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent(trig, gg_unit_u000_0649, EVENT_UNIT_DEATH)    
    call TriggerAddAction(trig, function FrozenThroneDies)
  endfunction

endlibrary
