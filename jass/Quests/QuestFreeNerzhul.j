library FreeNerzhul initializer OnInit requires QuestData, FrostwolfConfig, NewHordeConfig

  globals
    private QuestData QUEST_NERZHUL
    private QuestItemData QUESTITEM_KILL
  endglobals

  private function GiveStats takes unit whichUnit returns nothing
    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", GetUnitX(whichUnit), GetUnitY(whichUnit)))
    call SetHeroStr(whichUnit, GetHeroStr(whichUnit, false) + 10, true)
    call SetHeroAgi(whichUnit, GetHeroAgi(whichUnit, false) + 10, true)
    call SetHeroInt(whichUnit, GetHeroInt(whichUnit, false) + 10, true)
  endfunction

  private function FrozenThroneDies takes nothing returns nothing
    local Person killingPerson = Persons[GetPlayerId(GetOwningPlayer(GetKillingUnit()))]
    if killingPerson.team.containsPlayer(FACTION_FROSTWOLF.whichPerson.p) or killingPerson.team.containsPlayer(FACTION_NEW_HORDE.whichPerson.p) then
      call GiveStats(gg_unit_Othr_1598)
      call FACTION_FROSTWOLF.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
      call FACTION_NEW_HORDE.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_FROSTWOLF.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_FAILED, true)
      call FACTION_NEW_HORDE.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_FAILED, true)
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
    call FACTION_NEW_HORDE.addQuest(QUEST_NERZHUL)
  endfunction

endlibrary