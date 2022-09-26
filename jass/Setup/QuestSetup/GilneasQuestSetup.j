library GilneasQuestSetup requires GilneasSetup, QuestIllidanChapterOne, QuestIllidanChapterTwo, QuestIllidanChapterThree

  public function OnInit takes nothing returns nothing
    //Early duel
    local QuestData Quest1 = FACTION_GILNEAS.AddQuest(QuestTempestReach.create())
    local QuestData Quest2 = FACTION_GILNEAS.AddQuest(QuestStormglen.create())
    local QuestData Quest3 = FACTION_GILNEAS.AddQuest(QuestDuskhaven.create())
    local QuestData Quest4 = FACTION_GILNEAS.AddQuest(QuestKeelHarbor.create())
    local QuestData Quest5 = FACTION_GILNEAS.AddQuest(QuestGilneasCity.create())
  
    set FACTION_GILNEAS.StartingQuest = Quest1

    set Quest2.Progress = QUEST_PROGRESS_UNDISCOVERED
    set Quest3.Progress = QUEST_PROGRESS_UNDISCOVERED
    set Quest4.Progress = QUEST_PROGRESS_UNDISCOVERED

    call FACTION_GILNEAS.AddQuest(QuestGoldrinnElvePath.create())

    //set GOLDRINNHUMAN_PATH = QuestGoldrinnHumanPath.create()

  endfunction

endlibrary