library FrostwolfQuestSetup requires FrostwolfSetup, WarsongSetup, QuestDrektharsSpellbook, QuestFreeNerzhul, QuestGazlowe, QuestSeaWitch, QuestThunderBluff, QuestScepterOfTheQueen, QuestZeppelins
  
  public function OnInit takes nothing returns nothing
    //Setup
    local QuestData newQuest = FACTION_FROSTWOLF.AddQuest(QuestSeaWitch.create())
    set FACTION_FROSTWOLF.StartingQuest = newQuest
    call FACTION_FROSTWOLF.AddQuest(QuestThunderBluff.create(FACTION_WARSONG))
    //Starting duel
    call FACTION_FROSTWOLF.AddQuest(QuestDrektharsSpellbook.create())
    call FACTION_FROSTWOLF.AddQuest(QuestZeppelins.create())
    call FACTION_FROSTWOLF.AddQuest(QuestScepterOfTheQueenWarsong.create())
    //Misc
    call FACTION_FROSTWOLF.AddQuest(QuestGazlowe.create())
    call FACTION_FROSTWOLF.AddQuest(QuestOrgrimmar.create())
    call FACTION_FROSTWOLF.AddQuest(QuestFreeNerzhul.create())
  endfunction
  
endlibrary