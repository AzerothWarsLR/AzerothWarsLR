library IronforgeQuestSetup requires IronforgeSetup, QuestDarkIron, QuestGnomeregan, QuestWildhammer

  public function OnInit takes nothing returns nothing
    local QuestData newQuest = FACTION_IRONFORGE.AddQuest(QuestGnomeregan.create())
    set FACTION_IRONFORGE.StartingQuest = newQuest
    call FACTION_IRONFORGE.AddQuest(QuestDarkIron.create())
    call FACTION_IRONFORGE.AddQuest(QuestWildhammer.create())
  endfunction

endlibrary