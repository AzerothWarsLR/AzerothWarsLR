library FelHordeQuestSetup requires FelHordeSetup, QuestFelHordeKillIronforge, QuestFelHordeKillStormwind, QuestGrimBatol

  public function OnInit takes nothing returns nothing
    call FACTION_FEL_HORDE.AddQuest(QuestFelHordeKillIronforge.create())
    call FACTION_FEL_HORDE.AddQuest(QuestFelHordeKillStormwind.create())
    call FACTION_FEL_HORDE.AddQuest(QuestGrimBatol.create())
    call FACTION_FEL_HORDE.AddQuest(QuestGuldansLegacy.create())
  endfunction

endlibrary