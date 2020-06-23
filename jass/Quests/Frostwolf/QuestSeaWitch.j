//Frostwolf kills the Sea Witch. Thrall gets some boats to leave the Darkspear Isles.
//Presently this ONLY deals with the final component of the event. The rest is done in GUI. 

library QuestSeaWitch initializer OnInit requires QuestData, FrostwolfConfig

  globals
    private QuestData QUEST_SEAWITCH
    private QuestItemData QUESTITEM_KILL

    private weathereffect Storm
  endglobals

  private function Dies takes nothing returns nothing
    local Person killingPerson = Persons[GetPlayerId(GetOwningPlayer(GetKillingUnit()))]
    local group tempGroup = CreateGroup()
    local unit u

    if FACTION_FROSTWOLF.Person != 0 then
      //Update quest
      call FACTION_FROSTWOLF.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
      //Spawn escape ships
      call RemoveUnit(gg_unit_o02M_1463)
      call RemoveUnit(gg_unit_o02M_1374)
      call CreateUnit(FACTION_FROSTWOLF.Person.p, 'obot', GetRectCenterX(gg_rct_Thrall_Ship_1), GetRectCenterY(gg_rct_Thrall_Ship_1), 270)
      call CreateUnit(FACTION_FROSTWOLF.Person.p, 'obot', GetRectCenterX(gg_rct_Thrall_Ship_2), GetRectCenterY(gg_rct_Thrall_Ship_2), 270)
      //Transfer control of all passive units on island
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Darkspear_Island, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, FACTION_FROSTWOLF.Person.p)
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop
    else
      call FACTION_FROSTWOLF.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_FAILED, true)
    endif
    call DestroyGroup(tempGroup)
    call RemoveWeatherEffectBJ(Storm)
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterUnitEvent(trig, gg_unit_O02L_0340, EVENT_UNIT_DEATH)
    call TriggerAddAction(trig, function Dies)

    set QUEST_SEAWITCH = QuestData.create("Riders on the Storm", "Warchief Thrall and his forces have been shipwrecked on the Darkspear Isles. Kill the Sea Witch there to give them a chance to rebuild their fleet and escape.", "The sea witch Zar'jira has been slain. Thrall and Vol'jin can now set sail.", "ReplaceableTextures\\CommandButtons\\BTNGhost.blp")
    set QUESTITEM_KILL = QUEST_SEAWITCH.addItem("Kill the Sea Witch at Darkspear Isles")
    call FACTION_FROSTWOLF.addQuest(QUEST_SEAWITCH)
    set FACTION_FROSTWOLF.StartingQuest = QUEST_SEAWITCH

    set Storm = AddWeatherEffect(gg_rct_Darkspear_Island, 'RAhr')
    call EnableWeatherEffect(Storm, true)
  endfunction

endlibrary