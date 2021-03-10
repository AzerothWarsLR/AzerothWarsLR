library LegionQuestSetup requires LegionSetup, QuestDemonGateMonastery, QuestLegionCaptureSunwell, QuestLegionKillLordaeron, QuestSkullOfGuldan, QuestSummonLegion

  public function OnInit takes nothing returns nothing
    local QuestData newQuest = QuestSummonLegion.create()
    set FACTION_LEGION.StartingQuest = newQuest
    call FACTION_LEGION.AddQuest(QuestDemonGateMonastery.create())
    call FACTION_LEGION.AddQuest(QuestLegionCaptureSunwell.create())
    call FACTION_LEGION.AddQuest(QuestLegionKillLordaeron.create())
    call FACTION_LEGION.AddQuest(QuestSkullOfGuldan.create())
  endfunction

endlibrary