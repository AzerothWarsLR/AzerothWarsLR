library TwilightQuestSetup requires TwilightSetup

  public function OnInit takes nothing returns nothing

    set FACTION_TWILIGHT.StartingQuest = FACTION_TWILIGHT.AddQuest(QuestBastionBuild.create())
    call FACTION_TWILIGHT.AddQuest(QuestReanimateSylvanas.create())

  endfunction

endlibrary