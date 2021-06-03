library QuelthalasQuestSetup requires QuelthalasSetup, QuestDraktharon, QuestQueldanil, QuestTheBloodElves

  public function OnInit takes nothing returns nothing
    //Setup
    local QuestData newQuest = QuestQueldanil.create()
    call FACTION_QUELTHALAS.AddQuest(newQuest)
    set FACTION_QUELTHALAS.StartingQuest = newQuest
    //Early duel
    call FACTION_QUELTHALAS.AddQuest(QuestDraktharon.create())
    call FACTION_QUELTHALAS.AddQuest(QuestTheBloodElves.create())
  endfunction

endlibrary