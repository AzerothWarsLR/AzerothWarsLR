library SentinelsQuestSetup requires SentinelsSetup, QuestSentinelsKillFrostwolf, QuestSentinelsKillWarsong, QuestVaultoftheWardens, QuestScepterOfTheQueen

  public function OnInit takes nothing returns nothing
    //Early duel
    set FACTION_SENTINELS.StartingQuest = FACTION_SENTINELS.AddQuest(QuestSentinelsKillFrostwolf.create())
    call FACTION_SENTINELS.AddQuest(QuestSentinelsKillWarsong.create())
    call FACTION_SENTINELS.AddQuest(QuestScepterOfTheQueenSentinels.create())
    //Misc
    call FACTION_SENTINELS.AddQuest(QuestVaultoftheWardens.create())
  endfunction

endlibrary