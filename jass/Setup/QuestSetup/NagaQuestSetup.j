library NagaQuestSetup requires NagaSetup, GlobalQuest

  public function OnInit takes nothing returns nothing
    //Early duel

    call FACTION_NAGA.AddQuest(QuestDefeatAzshara.create())

    set EXILE_PATH = QuestExilePath.create()
    set REDEMPTION_PATH = QuestRedemptionPath.create()
    //set ALLIANCE_NAGA = QuestJoinAllianceNaga.create()
    set CONQUER_BLACK_TEMPLE = QuestBlackTemple.create()
    set KILL_FROZEN_THRONE = QuestFrozenThrone.create()
    set CHANNEL_EYE = QuestChannelEye.create()

  endfunction

endlibrary