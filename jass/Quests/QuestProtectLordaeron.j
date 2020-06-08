//When Capital Palace, Stratholme and Tyr's Hand Citadel all die, Arthas is removed and EventArthasExpedition begins.

library QuestProtectLordaeron initializer OnInit requires QuestData, LordaeronConfig, QuestKingArthas, QuestCorruptArthas

  globals
    private QuestData QUEST_PROTECTLORDAERON
    private QuestItemData QUESTITEM_PROTECTLORDAERON
  endglobals

  private function Abandon takes nothing returns nothing
    local unit arthas = gg_unit_Hart_1342
    local Person tempPerson = PersonsByFaction[FACTION_LORDAERON]          
    call KillUnit(arthas)
    call RemoveUnit(arthas)

    //Cleanup
    set arthas = null
  endfunction

  private function Dies takes nothing returns nothing
    local Person lordaeron = PersonsByFaction[FACTION_LORDAERON]
    if not IsUnitAliveBJ(gg_unit_h000_0406) and not IsUnitAliveBJ(gg_unit_h01G_0885) and not IsUnitAliveBJ(gg_unit_h030_0839) then
      if lordaeron != 0 then
        call Abandon()
      endif
      call FACTION_LORDAERON.setQuestItemStatus(QUESTITEM_PROTECTLORDAERON, QUEST_PROGRESS_FAILED, true)
      call FACTION_LORDAERON.setQuestItemStatus(QuestKingArthas_QUESTITEM_KINGARTHAS_PROTECT, QUEST_PROGRESS_FAILED, false)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    call TriggerRegisterUnitEvent( trig, gg_unit_h000_0406, EVENT_UNIT_DEATH )  //Capital Palace
    call TriggerRegisterUnitEvent( trig, gg_unit_h01G_0885, EVENT_UNIT_DEATH )  //Stratholme
    call TriggerRegisterUnitEvent( trig, gg_unit_h030_0839, EVENT_UNIT_DEATH )  //Tyr's Hand Citadel
    call TriggerAddCondition( trig, Condition(function Dies) )

    set QUEST_PROTECTLORDAERON = QuestData.create("Bastion of Humanity", "The Kingdom of Lordaeron faces threats from all sides. If all of its capitals fall, Prince Arthas will abandon his people on a mission of revenge.", "", "ReplaceableTextures\\CommandButtons\\BTNCastle.blp")
    set QUESTITEM_PROTECTLORDAERON = QUEST_PROTECTLORDAERON.addItem("Stratholme, Tyr's Hand or Capital Palace must survive")
    call FACTION_LORDAERON.addQuest(QUEST_PROTECTLORDAERON)  
    call FACTION_LORDAERON.setQuestItemStatus(QUESTITEM_PROTECTLORDAERON, QUEST_PROGRESS_COMPLETE, false)
  endfunction

endlibrary