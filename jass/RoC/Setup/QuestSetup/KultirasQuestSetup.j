library KultirasQuestSetup requires KultirasSetup

  public function OnInit takes nothing returns nothing

    set FACTION_KULTIRAS.StartingQuest = FACTION_KULTIRAS.AddQuest(QuestBlademaster.create())
    call FACTION_KULTIRAS.AddQuest(QuestBoralus.create())


  endfunction

endlibrary