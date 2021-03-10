library DalaranQuestSetup requires DalaranSetup, QuestBlueDragons, QuestCrystalGolem, QuestJainaSoulGem, QuestKarazhan, QuestNewGuardian, QuestTheramore

  public function OnInit takes nothing returns nothing
    local QuestData newQuest = FACTION_DALARAN.AddQuest(QuestJainaSoulGem.create())
    set FACTION_DALARAN.StartingQuest = newQuest
    call FACTION_DALARAN.AddQuest(QuestBlueDragons.create())
    call FACTION_DALARAN.AddQuest(QuestCrystalGolem.create())
    call FACTION_DALARAN.AddQuest(QuestKarazhan.create())
    call FACTION_DALARAN.AddQuest(QuestTheramore.create())
    call FACTION_DALARAN.AddQuest(QuestNewGuardian.create())
  endfunction

endlibrary