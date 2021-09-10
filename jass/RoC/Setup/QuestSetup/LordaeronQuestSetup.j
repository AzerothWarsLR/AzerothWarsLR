library LordaeronQuestSetup requires LordaeronSetup, QuestGarithos, QuestKingArthas, QuestShoresOfNorthrend, QuestThunderEagle, QuestKingdomOfManLordaeron, QuestMograine

  public function OnInit takes nothing returns nothing
    //Early duel
    set FACTION_LORDAERON.StartingQuest = FACTION_LORDAERON.AddQuest(QuestStratholme.create())
    call FACTION_LORDAERON.AddQuest(QuestCapitalCity.create())
    call FACTION_LORDAERON.AddQuest(QuestShoresOfNorthrend.create())
    call FACTION_LORDAERON.AddQuest(QuestThunderEagle.create())
    call FACTION_LORDAERON.AddQuest(QuestKingArthas.create())
    call FACTION_LORDAERON.AddQuest(QuestMograine.create())
    //Misc
    call FACTION_LORDAERON.AddQuest(QuestGarithos.create())
    call FACTION_LORDAERON.AddQuest(QuestKingdomOfManLordaeron.create())
  endfunction

endlibrary