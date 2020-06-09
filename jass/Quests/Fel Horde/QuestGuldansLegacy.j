library QuestGuldansLegacy requires QuestData, FelHordeConfig

  globals
    private QuestItemData QUESTITEM_VISIT
    private integer RESEARCH_ID = 0
  endglobals

  private function OnEnterRegion takes nothing returns nothing
    if IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true and FACTION_FEL_HORDE.getQuestItemProgress(QUESTITEM_VISIT) != QUEST_PROGRESS_COMPLETE then
      call FACTION_FEL_HORDE.setQuestItemProgress(QUESTITEM_VISIT, QUEST_PROGRESS_COMPLETE, true)
      call SetPlayerTechResearched(FACTION_FEL_HORDE.Person.p, RESEARCH_ID, 1)
    endif
  endfunction

  public function OnInit takes integer startDate returns nothing
    local trigger trig = CreateTrigger()
    local QuestData tempQuest
    call TriggerRegisterEnterRectSimple( trig, gg_rct_Guldan )
    call TriggerAddAction(trig, function OnEnterRegion)

    set tempQuest = QuestData.create("Gul'dans Legacy", "The Orc Warlock Gul'dan is ultimately responsible for the formation of the Fel Horde. Though long dead, his teachings could still be extracted from his body.", "Gul'dan's remains have been located within the Tomb of Sargeras. His eldritch knowledge may now be put to purpose.", "ReplaceableTextures\\CommandButtons\\BTNGuldan.blp")
    set QUESTITEM_VISIT = tempQuest.addItem("Bring a Fel Horde hero to Gul'dan's corpse in the Tomb of Sargeras")
    //set QUESTITEM_VISIT.X = GetRectCenterX(gg_rct_Guldan)
    //set QUESTITEM_VISIT.Y = GetRectCenterY(gg_rct_Guldan)
    call FACTION_FEL_HORDE.addQuest(tempQuest)
  endfunction


endlibrary