library SentinelsQuestSetup requires SentinelsConfig, QuestSentinelsKillFrostwolf, QuestSentinelsKillWarsong, QuestVaultoftheWardens, QuestScepterOfTheQueen

  public function OnInit takes nothing returns nothing
    call FACTION_SENTINELS.AddQuest(QuestSentinelsKillFrostwolf.create())
    call FACTION_SENTINELS.AddQuest(QuestSentinelsKillWarsong.create())
    call FACTION_SENTINELS.AddQuest(QuestScepterOfTheQueenSentinels.create())
    call FACTION_SENTINELS.AddQuest(QuestVaultoftheWardens.create())
  endfunction

endlibrary