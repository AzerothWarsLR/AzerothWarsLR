library QuestKillIllidan initializer OnInit requires QuestData, SentinelsConfig, IllidariConfig, SoloSentinelsConfig, NightElfConfig

  globals
    private QuestData QUEST_ILLIDAN
    private QuestItemData QUESTITEM_ILLIDARI
    private QuestItemData QUESTITEM_KILL
  endglobals

  private function Dies takes nothing returns nothing
    local Person sentinelsPerson = FACTION_SENTINELS.whichPerson
    if sentinelsPerson == 0 then
      set sentinelsPerson = FACTION_SOLO_SENTINELS.whichPerson
    endif
    if sentinelsPerson == 0 then
      set sentinelsPerson = FACTION_NIGHT_ELVES.whichPerson
    endif
    if GetOwningPlayer(GetKillingUnit()) == sentinelsPerson.p then
      call AddHeroXP(LEGEND_MAIEV.Unit, 2000, true)
      call AddHeroAttributes(LEGEND_MAIEV.Unit, 10, 10, 10)
      call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
      call FACTION_SOLO_SENTINELS.setQuestItemStatus(QUESTITEM_ILLIDARI, QUEST_PROGRESS_COMPLETE, true)
      call FACTION_NIGHT_ELVES.setQuestItemStatus(QUESTITEM_ILLIDARI, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
      call FACTION_SOLO_SENTINELS.setQuestItemStatus(QUESTITEM_ILLIDARI, QUEST_PROGRESS_COMPLETE, true)
      call FACTION_NIGHT_ELVES.setQuestItemStatus(QUESTITEM_ILLIDARI, QUEST_PROGRESS_COMPLETE, true)
    endif
  endfunction

  private function OnFactionChange takes nothing returns nothing
    if GetTriggerPerson().faction == FACTION_ILLIDARI then
      call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_ILLIDARI, QUEST_PROGRESS_COMPLETE, true)
      call FACTION_SOLO_SENTINELS.setQuestItemStatus(QUESTITEM_ILLIDARI, QUEST_PROGRESS_COMPLETE, true)
      call FACTION_NIGHT_ELVES.setQuestItemStatus(QUESTITEM_ILLIDARI, QUEST_PROGRESS_COMPLETE, true)
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    local integer i = 0
    local unit u = null

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_n05X_2874, EVENT_UNIT_DEATH )  //Tempest Keep
    call TriggerAddAction(trig, function Dies)

    set trig = CreateTrigger()
    call OnPersonFactionChange.register(trig)
    call TriggerAddAction(trig, function OnFactionChange)

    //Quest setup
    set QUEST_ILLIDAN = QuestData.create("Balancing the Scales", "Millenia ago, Illidan the Betrayer was imprisoned for atrocities committed during the War of the Ancients. Now, he has been released - a mistake that Maiev and her Wardens must rectify.", "With Tempest Keep destroyed, Illidan has finally been brought to heel. He has been returned to isolation within the Barrow Deeps along with the rest of his followers.", "ReplaceableTextures\\CommandButtons\\BTNMetamorphosis.blp")
    set QUESTITEM_ILLIDARI = QUEST_ILLIDAN.addItem("Illidan has escaped to Outland")
    set QUESTITEM_KILL = QUEST_ILLIDAN.addItem("Destroy Tempest Keep")
    call FACTION_SENTINELS.addQuest(QUEST_ILLIDAN)
    call FACTION_SENTINELS.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_UNDISCOVERED, false)
    call FACTION_SOLO_SENTINELS.addQuest(QUEST_ILLIDAN)
    call FACTION_SOLO_SENTINELS.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_UNDISCOVERED, false)
    call FACTION_NIGHT_ELVES.addQuest(QUEST_ILLIDAN)
    call FACTION_NIGHT_ELVES.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_UNDISCOVERED, false)
  endfunction

endlibrary