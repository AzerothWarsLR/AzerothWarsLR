library DraeneiQuestSetup requires DraeneiSetup

  public function OnInit takes nothing returns nothing
    //Setup
    local QuestData newQuest = FACTION_DRAENEI.AddQuest(QuestExiled.create())
    set FACTION_DRAENEI.StartingQuest = newQuest
    //Early duel
    call FACTION_DRAENEI.AddQuest(QuestShattrah.create())
    call FACTION_DRAENEI.AddQuest(QuestTelredor.create())
    call FACTION_DRAENEI.AddQuest(QuestHalaar.create())
    call FACTION_DRAENEI.AddQuest(QuestFarahlon.create())
    call FACTION_DRAENEI.AddQuest(QuestFirstWave.create())
    call FACTION_DRAENEI.AddQuest(QuestSurvivorsShattrah.create())
    call FACTION_DRAENEI.AddQuest(QuestBrokenOne.create())
    call FACTION_DRAENEI.AddQuest(QuestTriumvirate.create())

    set SHIP_ARGUS = QuestShipArgus.create()
    //Misc
  endfunction

endlibrary