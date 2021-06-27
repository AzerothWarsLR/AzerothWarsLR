library StormwindQuestSetup requires StormwindSetup, QuestConstructionSites, QuestHonorHold, QuestKultiras, QuestStromgarde, QuestCaptureGilneas, QuestKingdomOfManStormwind

  public function OnInit takes nothing returns nothing
    //Setup
    local QuestData newQuest = FACTION_STORMWIND.AddQuest(QuestConstructionSites.create())
    set FACTION_STORMWIND.StartingQuest = newQuest
    //Early duel
    call FACTION_STORMWIND.AddQuest(QuestHonorHold.create())
    //Misc
    call FACTION_STORMWIND.AddQuest(QuestKultiras.create())
    call FACTION_STORMWIND.AddQuest(QuestStromgarde.create())
    call FACTION_STORMWIND.AddQuest(QuestCaptureGilneas.create("Anti-Isolationist Policy", "Gilneas has sealed itself behind its enormous city walls, refusing to join the South Alliance in its defense against the Fel Horde. The issue must be forced.", false))
    call FACTION_STORMWIND.AddQuest(QuestKingdomOfManStormwind.create())
  endfunction

endlibrary