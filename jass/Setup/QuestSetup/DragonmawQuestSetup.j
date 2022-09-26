library DragonmawQuestSetup requires DragonmawSetup

  public function OnInit takes nothing returns nothing

    set FACTION_DRAGONMAW.StartingQuest = FACTION_DRAGONMAW.AddQuest(QuestDragonmawPort.create())
    call FACTION_DRAGONMAW.AddQuest(QuestGrimBatol.create())
    call FACTION_DRAGONMAW.AddQuest(QuestOrgrimmarPortal.create())

  endfunction

endlibrary