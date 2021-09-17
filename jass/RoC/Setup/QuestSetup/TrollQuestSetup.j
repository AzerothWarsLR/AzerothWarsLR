library TrollQuestSetup requires TrollSetup

  public function OnInit takes nothing returns nothing

    set FACTION_TROLL.StartingQuest = FACTION_TROLL.AddQuest(QuestZandalar.create())

  endfunction

endlibrary