library NagaQuestSetup requires NagaSetup, QuestIllidanChapterOne

  public function OnInit takes nothing returns nothing
    //Early duel
    local QuestData newQuest = FACTION_NAGA.AddQuest(QuestIllidanChapterOne.create())
    set FACTION_NAGA.StartingQuest = newQuest

  endfunction

endlibrary