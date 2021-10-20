library DalaranQuestSetup requires DalaranSetup, QuestBlueDragons, QuestCrystalGolem, QuestJainaSoulGem, QuestKarazhan, QuestNewGuardian, QuestTheramore, QuestFallenGuardian

  public function OnInit takes nothing returns nothing
    //Early duel
    local QuestData newQuest = FACTION_DALARAN.AddQuest(QuestSouthshore.create())
    set FACTION_DALARAN.StartingQuest = newQuest
    call FACTION_DALARAN.AddQuest(QuestShadowfang.create())
    call FACTION_DALARAN.AddQuest(QuestDalaran.create())
    call FACTION_DALARAN.AddQuest(QuestJainaSoulGem.create())
    call FACTION_DALARAN.AddQuest(QuestBlueDragons.create())
    call FACTION_DALARAN.AddQuest(QuestTheNexus.create())
    //Misc
    call FACTION_DALARAN.AddQuest(QuestKarazhan.create())
    call FACTION_DALARAN.AddQuest(QuestTheramore.create())

    set CRYSTAL_GOLEM = QuestCrystalGolem.create()
    call FACTION_DALARAN.AddQuest(CRYSTAL_GOLEM)
    set FALLEN_GUARDIAN = QuestFallenGuardian.create()
    call FACTION_DALARAN.AddQuest(FALLEN_GUARDIAN)
    set NEW_GUARDIAN = QuestNewGuardian.create()
    call FACTION_DALARAN.AddQuest(NEW_GUARDIAN)
  endfunction

endlibrary