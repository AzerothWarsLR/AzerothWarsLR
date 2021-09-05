library StormwindQuestSetup requires StormwindSetup, QuestConstructionSites, QuestHonorHold, QuestStromgarde, QuestKingdomOfManStormwind

  public function OnInit takes nothing returns nothing
    //Setup
    local QuestData newQuest = FACTION_STORMWIND.AddQuest(QuestConstructionSites.create())
    set FACTION_STORMWIND.StartingQuest = newQuest
    //Early duel
    call FACTION_STORMWIND.AddQuest(QuestHonorHold.create())
    //Misc
    call FACTION_STORMWIND.AddQuest(QuestStromgarde.create())
    call FACTION_STORMWIND.AddQuest(QuestKingdomOfManStormwind.create())
  endfunction

endlibrary