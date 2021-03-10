library LegionQuestSetup requires LegionSetup, QuestDemonGateMonastery, QuestLegionCaptureSunwell, QuestLegionKillLordaeron, QuestSkullOfGuldan, QuestSummonLegion

  public function OnInit takes nothing returns nothing
    call FACTION_LEGION.AddQuest(QuestDemonGateMonastery.create())
    call FACTION_LEGION.AddQuest(QuestLegionCaptureSunwell.create())
    call FACTION_LEGION.AddQuest(QuestLegionKillLordaeron.create())
    call FACTION_LEGION.AddQuest(QuestSkullOfGuldan.create())
    call FACTION_LEGION.AddQuest(QuestSummonLegion.create())
  endfunction

endlibrary