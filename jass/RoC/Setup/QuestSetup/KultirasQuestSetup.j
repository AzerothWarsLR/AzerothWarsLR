library KultirasQuestSetup requires KultirasSetup

  public function OnInit takes nothing returns nothing

    set FACTION_KULTIRAS.StartingQuest = FACTION_KULTIRAS.AddQuest(QuestBoralus.create())
    call FACTION_KULTIRAS.AddQuest(QuestUnlockShip.create())
    call FACTION_KULTIRAS.AddQuest(QuestSafeSea.create())
    call FACTION_KULTIRAS.AddQuest(QuestTheramore.create())
    call FACTION_KULTIRAS.AddQuest(QuestBeyondPortal.create())
    call FACTION_KULTIRAS.AddQuest(QuestJoinCrusade.create())

  endfunction

endlibrary