library ScarletQuestSetup requires ScarletSetup, QuestMonastery

  public function OnInit takes nothing returns nothing
    //Early duel
    set FACTION_SCARLET.StartingQuest = FACTION_SCARLET.AddQuest(QuestMonastery.create())
    call FACTION_SCARLET.AddQuest(QuestTyr.create())
  endfunction


endlibrary