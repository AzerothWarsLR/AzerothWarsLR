library LordaeronQuestSetup requires LordaeronSetup, QuestKingArthas, QuestShoresOfNorthrend, QuestThunderEagle, QuestKingdomOfManLordaeron

  public function OnInit takes nothing returns nothing
    //Early duel
    set FACTION_LORDAERON.StartingQuest = FACTION_LORDAERON.AddQuest(QuestStratholme.create())
    call FACTION_LORDAERON.AddQuest(QuestStrahnbrad.create())
    call FACTION_LORDAERON.AddQuest(QuestCapitalCity.create())
    
    call FACTION_LORDAERON.AddQuest(QuestShoresOfNorthrend.create())
    call FACTION_LORDAERON.AddQuest(QuestThunderEagle.create())
    call FACTION_LORDAERON.AddQuest(QuestKingArthas.create())
    call FACTION_LORDAERON.AddQuest(QuestLivingShadow.create())
    call FACTION_LORDAERON.AddQuest(QuestKingdomOfManLordaeron.create())
    call FACTION_LORDAERON.AddQuest(QuestGarithosCrusade.create())
    call FACTION_LORDAERON.AddQuest(QuestGarithosMindControl.create())

    set THE_ASHBRINGER = QuestAshbringer.create()

  endfunction

endlibrary