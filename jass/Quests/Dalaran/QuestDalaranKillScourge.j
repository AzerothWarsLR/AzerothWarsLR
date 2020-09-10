library QuestDalaranKillScourge initializer OnInit requires DalaranConfig, LegendScourge, Display

  globals
    private QuestItemData QUESTITEM_KILL

    private constant integer QUEST_RESEARCH_ID = 'R053'
    private constant integer UNITTYPE_ID = 'u01R'
    private constant integer CASTER_RESEARCH_ID = 'Rune'
  endglobals

  private function LichKingDies takes nothing returns nothing
    call FACTION_DALARAN.setQuestItemProgress(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
    call SetPlayerTechResearched(FACTION_DALARAN.Player, QUEST_RESEARCH_ID, 1)
    call SetPlayerTechResearched(FACTION_DALARAN.Player, CASTER_RESEARCH_ID, 3)
    call DisplayUnitTypeAcquired(FACTION_DALARAN.Player, UNITTYPE_ID, "You can now train " + GetObjectName(UNITTYPE_ID) + "s from the Arcane Sanctum.")
  endfunction

  private function OnInit takes nothing returns nothing
    local QuestData tempQuest
    local trigger trig

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_LICHKING.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function LichKingDies)

    set tempQuest = QuestData.create("Legitimate Necromancy", "The heinous actions of the Cult of the Damned have illegitimized necromancy in the eyes of the Council of Six.", "The Lich King has been slain. The practice of necromancy slowly returns to the academies of Dalaran.","ReplaceableTextures\\CommandButtons\\BTNNecromancer.blp")
    set QUESTITEM_KILL = tempQuest.addItem("The Frozen Throne is destroyed")
    call FACTION_DALARAN.addQuest(tempQuest)
    call FACTION_DALARAN.modObjectLimit(QUEST_RESEARCH_ID, UNLIMITED)
    call FACTION_DALARAN.modObjectLimit(UNITTYPE_ID, UNLIMITED)
    call FACTION_DALARAN.modObjectLimit(CASTER_RESEARCH_ID, UNLIMITED)
  endfunction

endlibrary