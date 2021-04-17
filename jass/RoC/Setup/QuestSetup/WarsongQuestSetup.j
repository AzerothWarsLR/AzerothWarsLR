library WarsongQuestSetup requires WarsongSetup, FrostwolfSetup, QuestChenStormstout, QuestCrossroads, QuestFountainOfBlood, QuestWarMachine, QuestWarsongHold, QuestWarsongKillDruids, QuestZulfarrak, QuestMoreWyverns

  public function OnInit takes nothing returns nothing
    set FACTION_WARSONG.StartingQuest = FACTION_WARSONG.AddQuest(QuestChenStormstout.create())
    call FACTION_WARSONG.AddQuest(QuestFountainOfBlood.create())
    call FACTION_WARSONG.AddQuest(QuestCrossroads.create(FACTION_FROSTWOLF))
    call FACTION_WARSONG.AddQuest(QuestWarsongHold.create())
    call FACTION_WARSONG.AddQuest(QuestWarsongKillDruids.create())
    call FACTION_WARSONG.AddQuest(QuestMoreWyverns.create())
    call FACTION_WARSONG.AddQuest(QuestZulfarrak.create())
    call FACTION_WARSONG.AddQuest(QuestZulgurub.create())
    call FACTION_WARSONG.AddQuest(QuestJinthaAlor.create())
    call FACTION_WARSONG.AddQuest(QuestGundrak.create())
  endfunction

endlibrary