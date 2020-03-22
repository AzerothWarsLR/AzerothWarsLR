library QuestDraktharon initializer OnInit requires QuestData, QuelthalasConfig

  globals
    private QuestData QUEST_DRAKTHARON
    private QuestItemData QUESTITEM_CAPTURE

    private constant integer DARKHAN_ID = 'h052'
    private constant integer DARKHAN_RESEARCH = 'R02H'
  endglobals

  private function Dies takes nothing returns nothing
    local Person triggerPerson = Persons[GetPlayerId(GetOwningPlayer(GetKillingUnit()))]
    local Person quelPerson = PersonsByFaction[FACTION_QUELTHALAS]
    if triggerPerson.team.containsPlayer(quelPerson.p) then
      call CreateUnit(quelPerson.p, DARKHAN_ID, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()), GetUnitFacing(GetTriggerUnit()))
      call SetPlayerTechResearched(quelPerson.p, DARKHAN_RESEARCH, 1)
      call FACTION_QUELTHALAS.setQuestItemStatus(QUESTITEM_CAPTURE, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_QUELTHALAS.setQuestItemStatus(QUESTITEM_CAPTURE, QUEST_PROGRESS_FAILED, true)
    endif
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    call TriggerRegisterUnitEvent( trig, gg_unit_o016_0771, EVENT_UNIT_DEATH )  //Drak'tharon Keep
    call TriggerAddAction(trig, function Dies)

    set QUEST_DRAKTHARON = QuestData.create("Drak'tharon Keep", "Some time ago, Magister Dar'Khan Drakthir set sail to Northrend and hasn't been since. Perhaps if he can be found, he can be convinced to rejoin his people.", "Dar'Khan Drathir, a revered member of the Convocation of Silvermoon, has returned to serve the High Elves after his mysterious disappearance.", "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp")
    set QUESTITEM_CAPTURE = QUEST_DRAKTHARON.addItem("Capture Drak'tharon Keep")
    call FACTION_QUELTHALAS.addQuest(QUEST_DRAKTHARON) 
  endfunction

endlibrary