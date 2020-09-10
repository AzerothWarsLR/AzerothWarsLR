library QuestKillRagnaros initializer OnInit requires QuestData, IronforgeConfig, LegendNeutral

  globals
    private QuestItemData QUESTITEM_KILL
    private constant integer RESEARCH_ID = 'R043'
  endglobals

  private function RagnarosDies takes nothing returns nothing
    if FACTION_IRONFORGE.Team.ContainsPlayer(GetOwningPlayer(GetKillingUnit())) then
      call FACTION_IRONFORGE.setQuestItemProgress(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
      call SetPlayerTechResearched(FACTION_IRONFORGE.Player, RESEARCH_ID, 1)
      call DisplayResearchAcquired(FACTION_IRONFORGE.Player, RESEARCH_ID, 1)
    else
      call FACTION_IRONFORGE.setQuestItemProgress(QUESTITEM_KILL, QUEST_PROGRESS_FAILED, true)
    endif
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    local QuestData tempQuest
    call TriggerRegisterUnitEvent(trig, gg_unit_N00D_1457, EVENT_UNIT_DEATH)    
    call TriggerAddAction(trig, function RagnarosDies)

    //Quest setup
    set tempQuest = QuestData.create("Harness the Inferno", "The Firelord Ragnaros resides deep within the Molten Core. With his death, the elemental smiths of Ironforge could leverage his primal fire to enhance their creations.", "Ragnaros has been slain. His essence has been harvested and will be put to use immediately.", "ReplaceableTextures\\CommandButtons\\BTNOrbOfFire.blp")
    set QUESTITEM_KILL = tempQuest.addItem("Kill Ragnaros")
    call FACTION_IRONFORGE.addQuest(tempQuest)
    call FACTION_IRONFORGE.modObjectLimit(RESEARCH_ID, UNLIMITED)
  endfunction

endlibrary