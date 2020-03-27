library QuestAndrassil initializer OnInit requires QuestData, DruidsConfig, NightElfConfig

  globals
    private QuestData QUEST_ANDRASSIL
    private QuestItemData QUESTITEM_KILL
  endglobals

  private function Dies takes nothing returns nothing
    local Person druidsPerson = FACTION_DRUIDS.whichPerson
    local unit andrassil
    if druidsPerson == 0 then
      set druidsPerson = FACTION_NIGHT_ELVES.whichPerson
    endif
    if GetOwningPlayer(GetKillingUnit()) == druidsPerson.p then
      set andrassil = CreateUnit(druidsPerson.p, 'n04F', GetRectCenterX(gg_rct_Andrassil), GetRectCenterY(gg_rct_Andrassil), 0)
      call UnitRescue(andrassil, druidsPerson.p)
      call FACTION_DRUIDS.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
      call FACTION_NIGHT_ELVES.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_DRUIDS.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_FAILED, true)
      call FACTION_NIGHT_ELVES.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_FAILED, true)
    endif
    set andrassil = null
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    local integer i = 0
    local unit u = null

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_u000_0649, EVENT_UNIT_DEATH )  //Frozen Throne
    call TriggerAddAction(trig, function Dies)

    //Quest setup
    set QUEST_ANDRASSIL = QuestData.create("Crown of the Snow", "Long ago, Fandral Staghelm cut a sapling from Nordrassil and used it to grow Andrassil in Northrend. Without the blessing of the Aspects, it fell to the Old Gods' corruption. If Northrend were to be reclaimed, Andrassil's growth could begin anew.", "With Northrend finally free of the Lich King's influence, the time is ripe to regrow Andrassil in the hope that it can help reclaim this barren land.", "ReplaceableTextures\\CommandButtons\\BTNTreant.blp")
    set QUESTITEM_KILL = QUEST_ANDRASSIL.addItem("Destroy the Frozen Throne")
    call FACTION_DRUIDS.addQuest(QUEST_ANDRASSIL)
    call FACTION_NIGHT_ELVES.addQuest(QUEST_ANDRASSIL)
  endfunction

endlibrary