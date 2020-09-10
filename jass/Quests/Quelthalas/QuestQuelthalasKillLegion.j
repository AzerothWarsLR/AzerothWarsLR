library QuestQuelthalasKillLegion initializer OnInit requires QuelthalasConfig, LegendLegion, Display

  globals
    private QuestItemData QUESTITEM_KILL

    private constant integer QUEST_RESEARCH_ID = 'R04Q'
    private constant integer UNITTYPE_ID = 'n0A2'
    private constant integer CASTER_RESEARCH_ID = 'R027'
  endglobals

  private function LegionNexusDies takes nothing returns nothing
    call FACTION_QUELTHALAS.setQuestItemProgress(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
    call SetPlayerTechResearched(FACTION_QUELTHALAS.Player, QUEST_RESEARCH_ID, 1)
    call SetPlayerTechResearched(FACTION_QUELTHALAS.Player, CASTER_RESEARCH_ID, 3)
    call DisplayUnitTypeAcquired(FACTION_QUELTHALAS.Player, UNITTYPE_ID, "You can now train " + GetObjectName(UNITTYPE_ID) + "s from the Arcane Sanctum.")
  endfunction

  private function OnInit takes nothing returns nothing
    local QuestData tempQuest
    local trigger trig

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_LEGIONNEXUS.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function LegionNexusDies)

    set tempQuest = QuestData.create("Illicit Practices", "Ever since Sargeras caught scent of Azeroth's magic overuse, demonology has been forbidden in Quel'thalas.", "The Legion Nexus has been destroyed. The practice of demonology experiences a resurgence in High Elven society.","ReplaceableTextures\\CommandButtons\\BTNHighElvenCleric.blp")
    set QUESTITEM_KILL = tempQuest.addItem("The Legion Nexus is destroyed")
    call FACTION_QUELTHALAS.addQuest(tempQuest)
    call FACTION_QUELTHALAS.modObjectLimit(QUEST_RESEARCH_ID, UNLIMITED)
    call FACTION_QUELTHALAS.modObjectLimit(UNITTYPE_ID, UNLIMITED)
    call FACTION_QUELTHALAS.modObjectLimit(CASTER_RESEARCH_ID, UNLIMITED)
  endfunction

endlibrary