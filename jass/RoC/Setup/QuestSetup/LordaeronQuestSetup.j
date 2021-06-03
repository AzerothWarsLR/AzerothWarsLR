library LordaeronQuestSetup requires LordaeronSetup, QuestGarithos, QuestKingArthas, QuestShoresOfNorthrend, QuestThunderEagle, QuestCaptureGilneas, QuestKingdomOfMan

  public function OnInit takes nothing returns nothing
    //Early duel
    set FACTION_LORDAERON.StartingQuest = FACTION_LORDAERON.AddQuest(QuestShoresOfNorthrend.create())
    call FACTION_LORDAERON.AddQuest(QuestKingArthas.create())
    call FACTION_LORDAERON.AddQuest(QuestThunderEagle.create())
    //Misc
    call FACTION_LORDAERON.AddQuest(QuestGarithos.create())
    call FACTION_LORDAERON.AddQuest(QuestCaptureGilneas.create("Anti-Isolationist Policy", "Gilneas has sealed itself behind its enormous city walls, refusing to join the North Alliance in its defense against the Scourge. The issue must be forced.", false))
    call FACTION_LORDAERON.AddQuest(QuestKingdomOfMan.create())
  endfunction

endlibrary