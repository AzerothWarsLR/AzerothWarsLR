library SentinelsKillFrostwolf initializer OnInit requires SentinelsConfig, LegendFrostwolf, Display

  globals
    private QuestItemData QUESTITEM_THUNDERBLUFF
    private QuestItemData QUESTITEM_ORGRIMMAR
    private constant integer RESEARCH_ID = 'R052'
    private constant integer AMARA_ID = 'h03I'
  endglobals

  private function TryComplete takes nothing returns nothing
    if FACTION_SENTINELS.getQuestItemProgress(QUESTITEM_THUNDERBLUFF) == QUEST_PROGRESS_COMPLETE and FACTION_SENTINELS.getQuestItemProgress(QUESTITEM_ORGRIMMAR) == QUEST_PROGRESS_COMPLETE then
      call SetPlayerTechResearched(FACTION_SENTINELS.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(FACTION_SENTINELS.Player, AMARA_ID, "You can now revive Amara from the Altar of Elders.")
    endif
  endfunction

  private function ThunderBluffDies takes nothing returns nothing
    call FACTION_SENTINELS.setQuestItemProgress(QUESTITEM_THUNDERBLUFF, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction

  private function OrgrimmarDies takes nothing returns nothing
    call FACTION_SENTINELS.setQuestItemProgress(QUESTITEM_ORGRIMMAR, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction

  private function OnInit takes nothing returns nothing
    local QuestData tempQuest
    local trigger trig

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_THUNDERBLUFF.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function ThunderBluffDies)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_ORGRIMMAR.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function OrgrimmarDies)

    set tempQuest = QuestData.create("Drive Them Back", "The Frostwolf Clan is beginning to seize a firm foothold within the Barrens and on the plains of Mulgore. They must be driven back.", "The Frostwolves have been ousted from Kalimdor, along with their Tauren allies. They will not be missed.","ReplaceableTextures\\CommandButtons\\BTNThrall.blp")
    call FACTION_SENTINELS.registerObjectLimit(AMARA_ID, 1)
    call FACTION_SENTINELS.registerObjectLimit(RESEARCH_ID, UNLIMITED)
    set QUESTITEM_THUNDERBLUFF = tempQuest.addItem("Thunderbluff is destroyed")
    set QUESTITEM_ORGRIMMAR = tempQuest.addItem("Orgrimmar is destroyed")
        call FACTION_SENTINELS.addQuest(tempQuest)
  endfunction

endlibrary