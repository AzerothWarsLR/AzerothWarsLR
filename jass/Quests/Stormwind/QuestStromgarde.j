library QuestStromgarde initializer OnInit requires QuestData, StormwindConfig, DetermineLevel, GeneralHelpers

  globals
    private QuestData QUEST_STROMGARDE
    private QuestItemData QUESTITEM_VISIT
  endglobals

  private function Build takes nothing returns nothing
    local group tempGroup = CreateGroup()
    local unit u
    local Person tempPerson = 0
    local player recipient = Player(PLAYER_NEUTRAL_AGGRESSIVE)

    if PersonsByFaction[FACTION_STORMWIND] != 0 then
      set tempPerson = PersonsByFaction[FACTION_STORMWIND]
      set recipient = tempPerson.p                         
    endif

    //If recipient is Stormwind, level Galen, otherwise delete him
    if Persons[GetPlayerId(recipient)].faction == FACTION_STORMWIND then
      call UnitDetermineLevel( gg_unit_H00Z_1936, 1.0 )
    else
      call RemoveUnit(gg_unit_H00Z_1936)           
    endif

    //Transfer all Neutral Passive units in Stromgarde to one of the above factions
    call GroupEnumUnitsInRect(tempGroup, gg_rct_Stromgarde, null)
    
    loop
      set u = FirstOfGroup(tempGroup)
      exitwhen u == null
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call UnitRescue(u, recipient)
      endif
      call GroupRemoveUnit(tempGroup, u)
    endloop
    //Update quest
    call FACTION_STORMWIND.setQuestItemStatus(QUESTITEM_VISIT, QUEST_PROGRESS_COMPLETE, true)      

    //Cleanup
    call DestroyGroup(tempGroup)
    call DestroyTrigger(GetTriggeringTrigger())
    set recipient = null
    set tempGroup = null
  endfunction

  private function EntersRegion takes nothing returns nothing
    if IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) and GetOwningPlayer(GetTriggerUnit()) == FACTION_STORMWIND.whichPerson.p then
      call Build()
    endif
  endfunction    

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_Stromgarde)
    call TriggerAddCondition(trig, Condition(function EntersRegion))    

    set QUEST_STROMGARDE = QuestData.create("Stromgarde", "Although Stromgarde's strength has dwindled since the days of the Arathorian Empire, it remains a significant bastion of humanity. They could be convinced to mobilize their forces for Stormwind.", "Galen Trollbane has pleged his forces to Stormwind's cause.", "ReplaceableTextures\\CommandButtons\\BTNTheCaptain.blp")
    set QUESTITEM_VISIT = QUEST_STROMGARDE.addItem("Bring a hero to Stromgarde")
    call FACTION_STORMWIND.addQuest(QUEST_STROMGARDE)   
  endfunction

endlibrary