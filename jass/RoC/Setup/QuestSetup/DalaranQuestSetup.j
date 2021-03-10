library DalaranQuestSetup requires DalaranSetup, QuestBlueDragons, QuestCrystalGolem, QuestJainaSoulGem, QuestKarazhan, QuestNewGuardian, QuestTheramore

  public function OnInit takes nothing returns nothing
    call FACTION_DALARAN.AddQuest(QuestJainaSoulGem.create())
    call FACTION_DALARAN.AddQuest(QuestBlueDragons.create())
    call FACTION_DALARAN.AddQuest(QuestCrystalGolem.create())
    call FACTION_DALARAN.AddQuest(QuestKarazhan.create())
    call FACTION_DALARAN.AddQuest(QuestTheramore.create())
    call FACTION_DALARAN.AddQuest(QuestNewGuardian.create())
  endfunction

endlibrary