library DraeneiQuestSetup requires DraeneiSetup

  public function OnInit takes nothing returns nothing
    //Setup
    local QuestData newQuest = FACTION_DRAENEI.AddQuest(QuestMalfurionAwakens.create())
    set FACTION_DRAENEI.StartingQuest = newQuest
    //Early duel
    call FACTION_DRAENEI.AddQuest(QuestAshenvale.create())
    //Misc
    call FACTION_DRAENEI.AddQuest(QuestAndrassil.create())
    call FACTION_DRAENEI.AddQuest(QuestTortolla.create())
  endfunction

endlibrary