library ScarletQuestSetup requires ScarletSetup, QuestMonastery

  public function OnInit takes nothing returns nothing
    //Early duel
    set FACTION_SCARLET.StartingQuest = FACTION_SCARLET.AddQuest(QuestTownWatch.create())

    set QUEST_MONASTERY = QuestMonastery.create()
    call FACTION_SCARLET.AddQuest(QUEST_MONASTERY)

    call FACTION_SCARLET.AddQuest(QuestArgentDawn.create())
    call FACTION_SCARLET.AddQuest(QuestArathiVolunteers.create())
    call FACTION_SCARLET.AddQuest(QuestTyr.create())
    call FACTION_SCARLET.AddQuest(QuestLiberateLordaeron.create())
  endfunction


endlibrary