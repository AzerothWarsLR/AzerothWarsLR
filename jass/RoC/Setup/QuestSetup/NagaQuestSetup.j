library NagaQuestSetup requires NagaSetup, QuestIllidanChapterOne, QuestIllidanChapterTwo, QuestIllidanChapterThree

  public function OnInit takes nothing returns nothing
    //Early duel
    local QuestData newQuest = FACTION_NAGA.AddQuest(QuestIllidanChapterOne.create())
  
    set FACTION_NAGA.StartingQuest = newQuest

    call FACTION_NAGA.AddQuest(QuestIllidanChapterTwo.create())
    call FACTION_NAGA.AddQuest(QuestIllidanChapterThree.create())

  endfunction

endlibrary