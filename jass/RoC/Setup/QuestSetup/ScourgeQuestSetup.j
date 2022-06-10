library ScourgeQuestSetup requires ScourgeSetup, QuestSapphiron QuestCorruptArthas, QuestKelthuzad, QuestLichKingArthas, QuestPlague, QuestReanimateSylvanas

  public function OnInit takes nothing returns nothing
    local QuestSpiderWar questSpiderWar = QuestSpiderWar.create()
    local QuestKelthuzad questKelthuzad = QuestKelthuzad.create()
    local QuestDrakUnlock questDrakUnlock = QuestDrakUnlock.create()
    local QuestPlague questPlague = QuestPlague.create()
    local QuestSapphiron questSapphiron = QuestSapphiron.create()
    local QuestCorruptArthas questCorruptArthas = QuestCorruptArthas.create()
    local QuestNaxxramas questNaxxramas = QuestNaxxramas.create() 
    local QuestLichKingArthas questLichKingArthas = QuestLichKingArthas.create()
    set QUEST_CIVILWAR = QuestCivilWar.create()

    call questNaxxramas.AddQuestItem(QuestItemCompleteQuest.create(questKelthuzad))

    //Setup
    call FACTION_SCOURGE.AddQuest(questSpiderWar)
    set FACTION_SCOURGE.StartingQuest = questSpiderWar
    call FACTION_SCOURGE.AddQuest(questDrakUnlock)
    call FACTION_SCOURGE.AddQuest(questPlague)
    call FACTION_SCOURGE.AddQuest(questSapphiron)
    //Early duel
    call FACTION_SCOURGE.AddQuest(questCorruptArthas)
    call FACTION_SCOURGE.AddQuest(questKelthuzad)
    call FACTION_SCOURGE.AddQuest(questNaxxramas)
    call FACTION_SCOURGE.AddQuest(QUEST_CIVILWAR)
    //Misc
    call FACTION_SCOURGE.AddQuest(questLichKingArthas)
  endfunction

endlibrary