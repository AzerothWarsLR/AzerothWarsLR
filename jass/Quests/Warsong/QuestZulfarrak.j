library QuestZulfarrak initializer OnInit requires WarsongConfig, LegendNeutral

  globals
    private QuestItemData QUESTITEM_CAPTURE
  endglobals

  private function LegendOwnerChanges takes nothing returns nothing
    local unit u
    local group tempGroup
    if GetTriggerLegend() == LEGEND_ZULFARRAK and FACTION_WARSONG.Player == GetOwningPlayer(LEGEND_ZULFARRAK.Unit) and FACTION_WARSONG.getQuestItemProgress(QUESTITEM_CAPTURE) == QUEST_PROGRESS_INCOMPLETE then
      call FACTION_WARSONG.setQuestItemProgress(QUESTITEM_CAPTURE, QUEST_PROGRESS_COMPLETE, true)
      set tempGroup = CreateGroup()
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Zulfarrak, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) or GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_AGGRESSIVE) then
          if IsUnitType(u, UNIT_TYPE_HERO) == true then
            call KillUnit(u)
          else
            call UnitRescue(u, FACTION_WARSONG.Player)
          endif
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop   
      call DestroyGroup(tempGroup)
      call CreateUnits(FACTION_WARSONG.Player, 'ndtb', GetRectCenterX(gg_rct_Zulfarrak), GetRectCenterY(gg_rct_Zulfarrak), 302, 8)
      call CreateUnits(FACTION_WARSONG.Player, 'ndtp', GetRectCenterX(gg_rct_Zulfarrak), GetRectCenterY(gg_rct_Zulfarrak), 302, 4)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    local QuestData tempQuest
    set trig = CreateTrigger()
    call OnLegendChangeOwner.register(trig)
    call TriggerAddCondition(trig, Condition(function LegendOwnerChanges))

    set tempQuest = QuestData.create("Fury of the Sands", "The Sandfury Trolls of Zul'farrak are openly hostile to visitors, but they share a common heritage with the Darkspear Trolls. An adequate display of force could bring them around.", "Zul'farrak has fallen. The Sandfury trolls lend their might to the Horde." , "ReplaceableTextures\\CommandButtons\\BTNDarkTroll.blp")
    set QUESTITEM_CAPTURE = tempQuest.addItem("Capture Zul'farrak")
    call FACTION_WARSONG.addQuest(tempQuest) 
  endfunction

endlibrary