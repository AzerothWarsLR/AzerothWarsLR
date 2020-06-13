library FreeNerzhul initializer OnInit requires QuestData, LegendFrostwolf, FrostwolfConfig

  globals
    private QuestData QUEST_NERZHUL
    private QuestItemData QUESTITEM_KILL
  endglobals

  private function FrozenThroneDies takes nothing returns nothing
    if FACTION_FROSTWOLF.Person.Team.containsPlayer(GetOwningPlayer(GetKillingUnit())) then
      call AddHeroAttributes(LEGEND_THRALL.Unit, 10, 10, 10)
      call FACTION_FROSTWOLF.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_FROSTWOLF.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_FAILED, true)
    endif
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterUnitEvent(trig, gg_unit_u000_0649, EVENT_UNIT_DEATH)    
    call TriggerAddAction(trig, function FrozenThroneDies)

    //Quest setup
    set QUEST_NERZHUL = QuestData.create("Jailor of the Damned", "Before he became the Lich King, Ner'zhul was the chieftain and elder shaman of the Shadowmoon Clan. Perhaps something of his former self still survives within the Frozen Throne.", "Ner'zhul is finally free from his tortured existence as the bearer of the Helm of Domination. With his dying breath, he passes his wisdom on to Thrall.", "ReplaceableTextures\\CommandButtons\\BTNShaman.blp")
    set QUESTITEM_KILL = QUEST_NERZHUL.addItem("Destroy the Frozen Throne")
    call FACTION_FROSTWOLF.addQuest(QUEST_NERZHUL)
  endfunction

endlibrary