library DraeneiQuestSetup requires DraeneiSetup

  public function OnInit takes nothing returns nothing
    //Setup
    local QuestData newQuest = FACTION_DRAENEI.AddQuest(QuestExiled.create())
    set FACTION_DRAENEI.StartingQuest = newQuest
    //Early duel
    call FACTION_DRAENEI.AddQuest(QuestAshenvale.create())
    //Misc
  endfunction

endlibrary