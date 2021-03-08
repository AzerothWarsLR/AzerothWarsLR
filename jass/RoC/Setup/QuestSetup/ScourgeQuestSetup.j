library ScourgeQuestSetup requires ScourgeConfig, QuestCorruptArthas, QuestCorruptSunwell, QuestKelthuzad, QuestLichKingArthas, QuestPlague, QuestReanimateSylvanas, QuestSapphiron, QuestCaptureGilneas

  public function OnInit takes nothing returns nothing
    call FACTION_SCOURGE.AddQuest(QuestCorruptArthas.create())
    call FACTION_SCOURGE.AddQuest(QuestCorruptSunwell.create())
    call FACTION_SCOURGE.AddQuest(QuestKelthuzad.create())
    call FACTION_SCOURGE.AddQuest(QuestLichKingArthas.create())
    call FACTION_SCOURGE.AddQuest(QuestPlague.create())
    call FACTION_SCOURGE.AddQuest(QuestReanimateSylvanas.create())
    call FACTION_SCOURGE.AddQuest(QuestSapphiron.create())
    call FACTION_SCOURGE.AddQuest(QuestCaptureGilneas.create("Late Harvest", "Gilneas has sealed itself behind its enormous city walls, believing that in doing so they will be protected against the Scourge's onslaught. They are wrong.", true))
  endfunction

endlibrary