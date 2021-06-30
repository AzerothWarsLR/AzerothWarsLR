library NagaQuestSetup requires NagaSetup, QuestIllidanChapterOne, QuestIllidanChapterTwo, QuestIllidanChapterThree

  public function OnInit takes nothing returns nothing
    //Early duel
    local QuestData ChapterOne = FACTION_NAGA.AddQuest(QuestIllidanChapterOne.create())
    local QuestData ChapterTwo = FACTION_NAGA.AddQuest(QuestIllidanChapterTwo.create())
    local QuestData ChapterThree = FACTION_NAGA.AddQuest(QuestIllidanChapterThree.create())
  
    set FACTION_NAGA.StartingQuest = ChapterOne

    set ChapterTwo.Progress = QUEST_PROGRESS_UNDISCOVERED
    set ChapterTwo.Progress = QUEST_PROGRESS_UNDISCOVERED

  endfunction

endlibrary