library FelHordeQuestSetup requires FelHordeSetup, QuestFelHordeKillIronforge, QuestFelHordeKillStormwind, QuestGrimBatol

  public function OnInit takes nothing returns nothing
    local QuestData newQuest = FACTION_FEL_HORDE.AddQuest(QuestFelHordeKillStormwind.create())
    set FACTION_FEL_HORDE.StartingQuest = newQuest
    call FACTION_FEL_HORDE.AddQuest(QuestFelHordeKillIronforge.create())
    call FACTION_FEL_HORDE.AddQuest(QuestGrimBatol.create())
    call FACTION_FEL_HORDE.AddQuest(QuestGuldansLegacy.create())
    call FACTION_FEL_HORDE.AddQuest(QuestChogall.create())
  endfunction

endlibrary