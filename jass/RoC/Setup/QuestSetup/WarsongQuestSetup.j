library WarsongQuestSetup requires WarsongSetup, FrostwolfSetup, QuestChenStormstout, QuestCrossroads, QuestFountainOfBlood, QuestWarMachine, QuestWarsongHold, QuestWarsongKillDruids, QuestZulfarrak, QuestMoreWyverns

  public function OnInit takes nothing returns nothing
    local QuestData newQuest = FACTION_WARSONG.AddQuest(QuestWarMachine.create())
    set FACTION_WARSONG.StartingQuest = newQuest
    call FACTION_WARSONG.AddQuest(QuestChenStormstout.create())
    call FACTION_WARSONG.AddQuest(QuestFountainOfBlood.create())
    call FACTION_WARSONG.AddQuest(QuestCrossroads.create(FACTION_FROSTWOLF))
    call FACTION_WARSONG.AddQuest(QuestWarsongHold.create())
    call FACTION_WARSONG.AddQuest(QuestWarsongKillDruids.create())
    call FACTION_WARSONG.AddQuest(QuestMoreWyverns.create())
    call FACTION_WARSONG.AddQuest(QuestZulfarrak.create())
  endfunction

endlibrary