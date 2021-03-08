library QuelthalasQuestSetup requires QuelthalasConfig, QuestDraktharon, QuestQueldanil, QuestTheBloodElves

  public function OnInit takes nothing returns nothing
    local QuestData newQuest = QuestQueldanil.create()
    call FACTION_QUELTHALAS.AddQuest(newQuest)
    set FACTION_QUELTHALAS.StartingQuest = newQuest
    call FACTION_QUELTHALAS.AddQuest(QuestDraktharon.create())
    call FACTION_QUELTHALAS.AddQuest(QuestTheBloodElves.create())
  endfunction

endlibrary