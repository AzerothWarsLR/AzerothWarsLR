library ForsakenQuestSetup requires ForsakenSetup

  public function OnInit takes nothing returns nothing

    set FACTION_FORSAKEN.StartingQuest = FACTION_FORSAKEN.AddQuest(QuestScholomanceBuild.create())

  endfunction

endlibrary