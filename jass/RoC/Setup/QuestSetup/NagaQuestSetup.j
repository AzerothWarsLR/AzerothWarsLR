library NagaQuestSetup requires NagaSetup, QuestIllidanChapterOne, QuestIllidanChapterTwo, QuestIllidanChapterThree

  public function OnInit takes nothing returns nothing
    //Early duel

    local QuestData chapterThree = QuestIllidanChapterThree.create()
    local QuestData chapterTwo = QuestIllidanChapterTwo.create(chapterThree)
    local QuestData chapterOne = QuestIllidanChapterOne.create(chapterTwo)
    call FACTION_NAGA.AddQuest(chapterOne)
    call FACTION_NAGA.AddQuest(chapterTwo)
    call FACTION_NAGA.AddQuest(chapterThree)

    set FACTION_NAGA.StartingQuest = chapterOne
  endfunction

endlibrary