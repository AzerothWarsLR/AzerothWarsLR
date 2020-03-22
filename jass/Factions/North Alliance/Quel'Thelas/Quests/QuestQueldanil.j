library QuestQueldanil initializer OnInit requires QuestData, QuelthalasConfig

  globals
    private QuestData QUEST_QUELDANIL
    private QuestItemData QUESTITEM_VISIT
  endglobals

  private function EntersRegion takes nothing returns nothing
    local Person triggerPerson = Persons[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]
    local Person quelPerson = PersonsByFaction[FACTION_QUELTHALAS]
    local unit u
    if triggerPerson.team.containsPlayer(quelPerson.p) then
      loop
        set u = FirstOfGroup(udg_QuelDanilLodge)
        exitwhen u == null
        call SetUnitOwner(u, quelPerson.p, true)
        call SetUnitInvulnerable(u, false)
        call GroupRemoveUnit(udg_QuelDanilLodge, u)
      endloop
      call FACTION_QUELTHALAS.setQuestItemStatus(QUESTITEM_VISIT, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_QUELTHALAS.setQuestItemStatus(QUESTITEM_VISIT, QUEST_PROGRESS_FAILED, true)
    endif
    //Cleanup
    call DestroyGroup(udg_QuelDanilLodge)
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple( trig, gg_rct_QuelDanil_Lodge )
    call TriggerAddCondition( trig, Condition( function EntersRegion ) )  

    set QUEST_QUELDANIL = QuestData.create("Quel'danil Lodge", "Quel'danil Lodge is a High Elven outpost situated in the Hinterlands. It's been some time since the rangers there have been in contact with Quel'thalas.", "Quel'thalas has finally reunited with its lost rangers in the Hinterlands.", "ReplaceableTextures\\CommandButtons\\BTNBearDen.blp")
    set QUESTITEM_VISIT = QUEST_QUELDANIL.addItem("Bring a unit to Quel'danil Lodge")
    call FACTION_QUELTHALAS.addQuest(QUEST_QUELDANIL) 
  endfunction

endlibrary