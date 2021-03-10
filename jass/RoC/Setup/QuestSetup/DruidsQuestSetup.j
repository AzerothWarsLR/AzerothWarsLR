library DruidsQuestSetup requires DruidsSetup, QuestAndrassil, QuestDruidsKillFrostwolf, QuestDruidsKillWarsong, QuestMalfurionAwakens

  public function OnInit takes nothing returns nothing
    call FACTION_DRUIDS.AddQuest(QuestAndrassil.create())
    call FACTION_DRUIDS.AddQuest(QuestDruidsKillFrostwolf.create())
    call FACTION_DRUIDS.AddQuest(QuestDruidsKillWarsong.create())
    call FACTION_DRUIDS.AddQuest(QuestMalfurionAwakens.create())
  endfunction

endlibrary