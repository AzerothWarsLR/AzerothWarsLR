library DruidsKillWarsong initializer OnInit requires DruidsConfig, LegendWarsong, Display

  globals
    private QuestItemData QUESTITEM_STONEMAUL
    private QuestItemData QUESTITEM_ENCAMPMENT
    private constant integer RESEARCH_ID = 'R05A'
  endglobals

  private function TryComplete takes nothing returns nothing
    if FACTION_DRUIDS.getQuestItemProgress(QUESTITEM_STONEMAUL) == QUEST_PROGRESS_COMPLETE and FACTION_DRUIDS.getQuestItemProgress(QUESTITEM_ENCAMPMENT) == QUEST_PROGRESS_COMPLETE then
      call SetPlayerTechResearched(FACTION_DRUIDS.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(FACTION_DRUIDS.Player, 'e012', "You can now train Siege Ancients at your Tree of Eternity, Tree of Ages and from your capitals.")
    endif
  endfunction

  private function StonemaulDies takes nothing returns nothing
    call FACTION_DRUIDS.setQuestItemProgress(QUESTITEM_STONEMAUL, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction

  private function EncampmentDies takes nothing returns nothing
    call FACTION_DRUIDS.setQuestItemProgress(QUESTITEM_ENCAMPMENT, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
  endfunction

  private function OnInit takes nothing returns nothing
    local QuestData tempQuest
    local trigger trig

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_STONEMAUL.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function StonemaulDies)

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, LEGEND_ENCAMPMENT.Unit, EVENT_UNIT_DEATH )
    call TriggerAddAction(trig, function EncampmentDies)

    set tempQuest = QuestData.create("Enemies at the Gate", "Arriving from another planet and across the seas of Azeroth, the Orcs of the Warsong Clan have arrived to ravage the wilderness and consume its bounty. They must be stopped.", "The Warsong presence on Kalimdor has been eliminated. The sacred lands are safe from their hatchets.","ReplaceableTextures\\CommandButtons\\BTNHellScream.blp")
    call FACTION_DRUIDS.modObjectLimit('e012', 6) //Siege Ancient
    set QUESTITEM_STONEMAUL = tempQuest.addItem("Stonemaul Keep is destroyed")
    set QUESTITEM_ENCAMPMENT = tempQuest.addItem("The Warsong Encampment on the Echo Isles is destroyed")
    call FACTION_DRUIDS.addQuest(tempQuest)
  endfunction

endlibrary