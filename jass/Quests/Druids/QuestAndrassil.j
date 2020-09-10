library QuestAndrassil initializer OnInit requires QuestData, ControlPoint, DruidsConfig

  globals
    private QuestData QUEST_ANDRASSIL
    private QuestItemData QUESTITEM_KILL
    private QuestItemData QUESTITEM_CAPTURE
  endglobals

  private function TryComplete takes nothing returns nothing
    if not UnitAlive(gg_unit_u000_0649) and GetOwningPlayer(gg_unit_n03U_0281) == FACTION_DRUIDS.Player then
      call CreateUnit(FACTION_DRUIDS.Player, 'n04F', GetRectCenterX(gg_rct_Andrassil), GetRectCenterY(gg_rct_Andrassil), 0)
    endif
  endfunction

  private function Dies takes nothing returns nothing
    call FACTION_DRUIDS.setQuestItemProgress(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
    call TryComplete()
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function Capture takes nothing returns nothing
    local Person capturePerson
    if GetUnitTypeId(GetTriggerControlPoint().u) == 'n03U' then
      set capturePerson = Person.ByHandle(GetTriggerControlPoint().owner)
      if capturePerson.Faction == FACTION_DRUIDS then
        call TryComplete()
        call FACTION_DRUIDS.setQuestItemProgress(QUESTITEM_CAPTURE, QUEST_PROGRESS_COMPLETE, true)
      else
        call FACTION_DRUIDS.setQuestItemProgress(QUESTITEM_CAPTURE, QUEST_PROGRESS_INCOMPLETE, false)
      endif
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    local integer i = 0
    local unit u = null

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_u000_0649, EVENT_UNIT_DEATH )  //Frozen Throne
    call TriggerAddAction(trig, function Dies)

    set trig = CreateTrigger()
    call OnControlPointOwnerChange.register(trig)
    call TriggerAddAction(trig, function Capture)

    //Quest setup
    set QUEST_ANDRASSIL = QuestData.create("Crown of the Snow", "Long ago, Fandral Staghelm cut a sapling from Nordrassil and used it to grow Andrassil in Northrend. Without the blessing of the Aspects, it fell to the Old Gods' corruption. If Northrend were to be reclaimed, Andrassil's growth could begin anew.", "With Northrend finally free of the Lich King's influence, the time is ripe to regrow Andrassil in the hope that it can help reclaim this barren land.", "ReplaceableTextures\\CommandButtons\\BTNTreant.blp")
    set QUESTITEM_KILL = QUEST_ANDRASSIL.addItem("The Frozen Throne is destroyed")
    set QUESTITEM_CAPTURE = QUEST_ANDRASSIL.addItem("Capture Grizzly Hills")
    call FACTION_DRUIDS.addQuest(QUEST_ANDRASSIL)
    call FACTION_DRUIDS.modObjectLimit('R05X', UNLIMITED)
  endfunction

endlibrary