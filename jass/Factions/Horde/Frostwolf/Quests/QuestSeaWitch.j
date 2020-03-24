//Frostwolf kills the Sea Witch. Thrall gets some boats to leave the Darkspear Isles.
//Presently this ONLY deals with the final component of the event. The rest is done in GUI. 

library QuestSeaWitch initializer OnInit requires QuestData, FrostwolfConfig, NewHordeConfig

  globals
    private QuestData QUEST_SEAWITCH
    private QuestItemData QUESTITEM_KILL

    private weathereffect Storm
  endglobals

  private function UnitRescue takes unit whichUnit, player whichPlayer returns nothing
    if GetLocalPlayer() == whichPlayer then
      call StartSound(bj_rescueSound)
    endif
    call SetUnitInvulnerable(whichUnit, false)
    call SetUnitOwner(whichUnit, whichPlayer, true)
    call UnitAddIndicator(whichUnit, 0, 255, 0, 255)
    call PingMinimapForPlayer(whichPlayer, GetUnitX(whichUnit), GetUnitY(whichUnit), bj_RESCUE_PING_TIME)
  endfunction

  private function Dies takes nothing returns nothing
    local Person killingPerson = Persons[GetPlayerId(GetOwningPlayer(GetKillingUnit()))]
    local Person frostwolfPerson = FACTION_FROSTWOLF.whichPerson
    local group tempGroup = CreateGroup()
    local unit u

    if frostwolfPerson == 0 then
      set frostwolfPerson = FACTION_NEW_HORDE.whichPerson
    endif

    if frostwolfPerson != 0 then
      //Update quest
      call FACTION_FROSTWOLF.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
      call FACTION_NEW_HORDE.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_COMPLETE, true)
      //Spawn escape ships
      call RemoveUnit(gg_unit_o02M_1463)
      call RemoveUnit(gg_unit_o02M_1374)
      call CreateUnit(frostwolfPerson.p, 'obot', GetRectCenterX(gg_rct_Thrall_Ship_1), GetRectCenterY(gg_rct_Thrall_Ship_1), 270)
      call CreateUnit(frostwolfPerson.p, 'obot', GetRectCenterX(gg_rct_Thrall_Ship_2), GetRectCenterY(gg_rct_Thrall_Ship_2), 270)
      //Transfer control of all passive units on island
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Darkspear_Island, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, frostwolfPerson.p)
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop
    else
      call FACTION_FROSTWOLF.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_FAILED, true)
      call FACTION_NEW_HORDE.setQuestItemStatus(QUESTITEM_KILL, QUEST_PROGRESS_FAILED, true)
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
    call FACTION_NEW_HORDE.addQuest(QUEST_SEAWITCH)

    set Storm = AddWeatherEffect(gg_rct_Darkspear_Island, 'RAhr')
    call EnableWeatherEffect(Storm, true)
  endfunction

endlibrary