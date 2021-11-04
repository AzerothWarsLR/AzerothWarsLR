library BlackEmpireQuestSetup requires BlackEmpireSetup

  public function OnInit takes nothing returns nothing

    set FACTION_BLACKEMPIRE.StartingQuest = FACTION_BLACKEMPIRE.AddQuest(QuestTitanJailors.create())
    call FACTION_BLACKEMPIRE.AddQuest(QuestAwakenCthun.create())
  endfunction

endlibrary