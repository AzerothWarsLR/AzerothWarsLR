library LegionQuestSetup requires LegionSetup, QuestDemonGateMonastery, QuestLegionCaptureSunwell, QuestLegionKillLordaeron, QuestSkullOfGuldan, QuestSummonLegion

  public function OnInit takes nothing returns nothing
    //Early duel
    local QuestData newQuest = FACTION_LEGION.AddQuest(QuestSummonLegion.create())
    set FACTION_LEGION.StartingQuest = newQuest
    call FACTION_LEGION.AddQuest(QuestDemonGateMonastery.create())
    call FACTION_LEGION.AddQuest(QuestLegionCaptureSunwell.create())
    call FACTION_LEGION.AddQuest(QuestLegionKillLordaeron.create())
    call FACTION_LEGION.AddQuest(QuestSkullOfGuldan.create())
    //Misc
    call FACTION_LEGION.AddQuest(QuestEmbassy.create())
  endfunction

endlibrary