library KultirasQuestSetup requires KultirasSetup

  public function OnInit takes nothing returns nothing
    //Early duel
    local QuestData ChapterOne = FACTION_GILNEAS.AddQuest(QuestGilneasChapterOne.create())
    local QuestData ChapterTwo = FACTION_GILNEAS.AddQuest(QuestGilneasChapterTwo.create())
    local QuestData ChapterThree = FACTION_GILNEAS.AddQuest(QuestGilneasChapterThree.create())
  
    set FACTION_KULTIRAS.StartingQuest = ChapterOne

    set ChapterTwo.Progress = QUEST_PROGRESS_UNDISCOVERED
    set ChapterThree.Progress = QUEST_PROGRESS_UNDISCOVERED

  endfunction

endlibrary