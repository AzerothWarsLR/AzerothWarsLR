library QuestDraktharon initializer OnInit requires QuestData, QuelthalasConfig, LegendNeutral

  globals
    private QuestData QUEST_DRAKTHARON
    private QuestItemData QUESTITEM_CAPTURE

    private constant integer DARKHAN_ID = 'h052'
    private constant integer DARKHAN_RESEARCH = 'R02H'
  endglobals

  private function LegendOwnerChanges takes nothing returns nothing
    if GetTriggerLegend() == LEGEND_DRAKTHARONKEEP and FACTION_QUELTHALAS.Team.ContainsPlayer(GetOwningPlayer(LEGEND_DRAKTHARONKEEP.Unit)) and FACTION_QUELTHALAS.getQuestItemProgress(QUESTITEM_CAPTURE) == QUEST_PROGRESS_INCOMPLETE then
      call CreateUnit(FACTION_QUELTHALAS.Player, DARKHAN_ID, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()), GetUnitFacing(GetTriggerUnit()))
      call SetPlayerTechResearched(FACTION_QUELTHALAS.Player, DARKHAN_RESEARCH, 1)
      call DisplayUnitTypeAcquired(FACTION_QUELTHALAS.Player, DARKHAN_ID, "You have acquired the demi-hero Dar'Khan Drakthir, and can revive him from the Altar of Kings if he dies.")
      call FACTION_QUELTHALAS.setQuestItemProgress(QUESTITEM_CAPTURE, QUEST_PROGRESS_COMPLETE, true)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    call OnLegendChangeOwner.register(trig)
    call TriggerAddAction(trig, function LegendOwnerChanges)

    set QUEST_DRAKTHARON = QuestData.create("Drak'tharon Keep", "Some time ago, Magister Dar'Khan Drakthir set sail to Northrend and hasn't been since. Perhaps if he can be found, he can be convinced to rejoin his people.", "Dar'Khan Drathir, a revered member of the Convocation of Silvermoon, has returned to serve the High Elves after his mysterious disappearance.", "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp")
    set QUESTITEM_CAPTURE = QUEST_DRAKTHARON.addItem("Capture Drak'tharon Keep")
    call FACTION_QUELTHALAS.addQuest(QUEST_DRAKTHARON) 
    call FACTION_QUELTHALAS.modObjectLimit(DARKHAN_ID, 1)
    call FACTION_QUELTHALAS.modObjectLimit(DARKHAN_RESEARCH, UNLIMITED)
  endfunction

endlibrary