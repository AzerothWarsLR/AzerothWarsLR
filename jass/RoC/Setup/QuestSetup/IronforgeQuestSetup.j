library IronforgeQuestSetup requires IronforgeSetup, QuestDarkIron, QuestGnomeregan, QuestWildhammer

  public function OnInit takes nothing returns nothing
    call FACTION_IRONFORGE.AddQuest(QuestDarkIron.create())
    call FACTION_IRONFORGE.AddQuest(QuestGnomeregan.create())
    call FACTION_IRONFORGE.AddQuest(QuestWildhammer.create())
  endfunction

endlibrary