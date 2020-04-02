library QuestKillMurmur initializer OnInit requires QuestData, FelHordeConfig

  globals
    private QuestData QUEST_MURMUR
    private QuestItemData QUESTITEM_KILL

    private constant integer RESEARCH = 'R05Y'
  endglobals

  private function Kill takes nothing returns nothing
    call FACTION_FEL_HORDE.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
    call SetPlayerTechResearched(FACTION_FEL_HORDE.whichPerson.p, RESEARCH, 1)
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterUnitEvent(trig, gg_unit_n03T_0555, EVENT_UNIT_DEATH)
    call TriggerAddAction(trig, function Kill)

    set QUEST_MURMUR = QuestData.create("Resounding Silence", "The extra-planar entity known as Murmur dominates the abandoned city of Auchindoun. If Murmur were to be slain, it would prove Magtheridon's dominance and rally further support from the Fel Orc clans.", "Murmur has been silenced. The Stormreaver and the Shattered Hand Clans are impressed with this display of strength, and express a desire to join the Fel Horde.", "ReplaceableTextures\\CommandButtons\\BTNSilence.blp")
    set QUESTITEM_KILL = QUEST_MURMUR.addItem("Kill Murmur outside Auchindoun")
    call FACTION_FEL_HORDE.addQuest(QUEST_MURMUR)
  endfunction

endlibrary