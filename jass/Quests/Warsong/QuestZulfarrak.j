library QuestZulfarrak initializer OnInit requires WarsongConfig, LegendNeutral

  globals
    private QuestItemData QUESTITEM_CAPTURE
  endglobals

  private function LegendOwnerChanges takes nothing returns nothing
    if GetTriggerLegend() == LEGEND_ZULFARRAK and FACTION_WARSONG.Person.p == GetOwningPlayer(LEGEND_ZULFARRAK.Unit) and FACTION_WARSONG.getQuestItemProgress(QUESTITEM_CAPTURE) == QUEST_PROGRESS_INCOMPLETE then
      call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_CAPTURE, QUEST_PROGRESS_COMPLETE, true)
      call RescueHostileUnitsInRect(gg_rct_Zulfarrak, FACTION_WARSONG.Person.p)
      call CreateUnits(FACTION_WARSONG.Person.p, 'ndtb', GetRectCenterX(gg_rct_Zulfarrak), GetRectCenterY(gg_rct_Zulfarrak), 302, 8)
      call CreateUnits(FACTION_WARSONG.Person.p, 'ndtp', GetRectCenterX(gg_rct_Zulfarrak), GetRectCenterY(gg_rct_Zulfarrak), 302, 4)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local QuestData tempQuest
    set trig = CreateTrigger()
    call OnLegendChangeOwner.register(trig)
    call TriggerAddCondition(trig, Condition(function LegendOwnerChanges))

    set tempQuest = QuestData.create("Fury of the Sands", "The Sandfury Trolls of Zul'farrak are openly hostile to visitors, but they share a common heritage with the Darkspear Trolls. An adequate display of force could bring them around.", "Zul'farrak has fallen. The Sandfury trolls lend their might to the Horde." , "ReplaceableTextures\\CommandButtons\\BTNBTNDarkTrollShadowPriest.blp")
    set QUESTITEM_CAPTURE = tempQuest.addItem("Capture Zul'farrak")
    call FACTION_WARSONG.addQuest(tempQuest) 
  endfunction

endlibrary