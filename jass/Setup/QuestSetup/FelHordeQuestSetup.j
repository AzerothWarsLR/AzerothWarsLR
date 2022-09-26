library FelHordeQuestSetup requires FelHordeSetup, QuestFelHordeKillIronforge, QuestFelHordeKillStormwind, QuestGrimBatol

  public function OnInit takes nothing returns nothing
    //Early duel
    local QuestData newQuest = FACTION_FEL_HORDE.AddQuest(QuestKillDraenei.create())
    set FACTION_FEL_HORDE.StartingQuest = newQuest
    call FACTION_FEL_HORDE.AddQuest(QuestKilsorrow.create())
    call FACTION_FEL_HORDE.AddQuest(QuestDarkPortalOpen.create())
    call FACTION_FEL_HORDE.AddQuest(QuestHellfire.create())
    call FACTION_FEL_HORDE.AddQuest(QuestBlackrock.create())
    call FACTION_FEL_HORDE.AddQuest(QuestFelHordeKillIronforge.create())
    call FACTION_FEL_HORDE.AddQuest(QuestFelHordeKillStormwind.create())
    //Misc
    call FACTION_FEL_HORDE.AddQuest(QuestGuldansLegacy.create())
  endfunction

endlibrary