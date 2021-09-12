library QuelthalasQuestSetup requires QuelthalasSetup, QuestQueldanil, QuestTheBloodElves

  public function OnInit takes nothing returns nothing
    //Setup
    local QuestData newQuest = FACTION_QUELTHALAS.AddQuest(QuestSilvermoon.create())
    set FACTION_QUELTHALAS.StartingQuest = newQuest
    //Early duel
    call FACTION_QUELTHALAS.AddQuest(QuestTheBloodElves.create())
    call FACTION_QUELTHALAS.AddQuest(QuestQueldanil.create())
  endfunction

endlibrary