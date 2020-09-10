library QuestLegionKillLordaeron initializer OnInit requires LegionConfig, LegendLordaeron, LegendLegion, Display

  globals
    private QuestItemData QUESTITEM_CAPITALPALACE
    private QuestItemData QUESTITEM_STRATHOLME
    private QuestItemData QUESTITEM_TYRSHAND
  endglobals

  private function TryComplete takes nothing returns nothing
    if FACTION_LEGION.getQuestItemProgress(QUESTITEM_CAPITALPALACE) == QUEST_PROGRESS_COMPLETE and FACTION_LEGION.getQuestItemProgress(QUESTITEM_STRATHOLME) == QUEST_PROGRESS_COMPLETE and FACTION_LEGION.getQuestItemProgress(QUESTITEM_TYRSHAND) == QUEST_PROGRESS_COMPLETE then
      call DisplayHeroReward(LEGEND_TICHONDRIUS.Unit, 15, 15, 15, 0)
      call AddHeroAttributes(LEGEND_TICHONDRIUS.Unit, 15, 15, 15)
    endif
  endfunction

  private function CapitalPalaceDies takes nothing returns nothing
    call FACTION_LEGION.setQuestItemProgress(QUESTITEM_CAPITALPALACE, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction

  private function StratholmeDies takes nothing returns nothing
    call FACTION_LEGION.setQuestItemProgress(QUESTITEM_STRATHOLME, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction

  private function TyrsHandDies takes nothing returns nothing
    call FACTION_LEGION.setQuestItemProgress(QUESTITEM_TYRSHAND, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction

  private function OnInit takes nothing returns nothing
    local QuestData tempQuest
    local trigger trig

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_CAPITALPALACE.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function CapitalPalaceDies)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_STRATHOLME.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function StratholmeDies)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_TYRSHAND.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function TyrsHandDies)

    set tempQuest = QuestData.create("Token Resistance", "The Kingdom of Lordaeron must be eliminated to pave the way for the Legion's arrival.", "The Kingdom of Lordaeron has fallen, eliminating Azeroth's vanguard against the Legion.","ReplaceableTextures\\CommandButtons\\BTNHeroPaladin.blp")
    set QUESTITEM_CAPITALPALACE = tempQuest.addItem("The Capital Palace of Lordaeron is destroyed")
    set QUESTITEM_STRATHOLME = tempQuest.addItem("Stratholme is destroyed")
    set QUESTITEM_TYRSHAND = tempQuest.addItem("Tyr's Hand is destroyed")
    call FACTION_LEGION.addQuest(tempQuest)
  endfunction

endlibrary