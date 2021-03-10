library DruidsQuestSetup requires DruidsSetup, QuestAndrassil, QuestDruidsKillFrostwolf, QuestDruidsKillWarsong, QuestMalfurionAwakens

  public function OnInit takes nothing returns nothing
    local QuestData newQuest = FACTION_DRUIDS.AddQuest(QuestMalfurionAwakens.create())
    set FACTION_DRUIDS.StartingQuest = newQuest
    call FACTION_DRUIDS.AddQuest(QuestAndrassil.create())
    call FACTION_DRUIDS.AddQuest(QuestDruidsKillFrostwolf.create())
    call FACTION_DRUIDS.AddQuest(QuestDruidsKillWarsong.create())
  endfunction

endlibrary