//If Grom enters the Warsong Camp area, OR a time elapses, OR someone becomes a solo Horde Path, give the Camp to a Horde player.

library QuestWarsongCamp initializer OnInit requires WarsongConfig, FrostwolfConfig, GeneralHelpers

  globals
    private QuestData QUEST_CAMP
    private QuestItemData QUESTITEM_BUILD

    private constant real TIMER = 240.     //How long it takes for Warsong Lumber Camp to be built instantly
  endglobals

  private function Build takes nothing returns nothing
    local group tempGroup = CreateGroup()
    local unit u
    local player recipient = Player(PLAYER_NEUTRAL_AGGRESSIVE)

    if FACTION_WARSONG.Person != 0 then
      set recipient = FACTION_WARSONG.Person.p
    elseif FACTION_FROSTWOLF.Person != 0 then
      set recipient = FACTION_FROSTWOLF.Person.p
    endif

    //Transfer all Neutral Passive units in Orgrimmar to one of the above factions
    call GroupEnumUnitsInRect(tempGroup, gg_rct_WarsongCamp, null)
    set u = FirstOfGroup(tempGroup)
    loop
    exitwhen u == null
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call UnitRescue(u, recipient)
      endif
      call GroupRemoveUnit(tempGroup, u)
      set u = FirstOfGroup(tempGroup)
    endloop      

    //Update quest (silently because Horde War Machine will kick in instead)
    call FACTION_WARSONG.setQuestItemStatus(QUESTITEM_BUILD, QUEST_PROGRESS_COMPLETE, false)

    //Cleanup
    call DestroyGroup (TempGroup)
    set recipient = null
    set tempGroup = null
  endfunction

  private function EntersRegion takes nothing returns nothing
    if GetUnitTypeId(GetTriggerUnit()) == 'Opgh' or GetUnitTypeId(GetTriggerUnit()) == 'Ogrh' then   //Grom or Grom Bloodpact
      call Build()
    endif
  endfunction    

  private function PersonFactionChanges takes nothing returns nothing
    if GetChangingPersonPrevFaction() == FACTION_WARSONG then
      call Build()
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function Conditions takes nothing returns boolean
    return FACTION_WARSONG.getQuestItemProgress(QUEST_CAMP) == QUEST_PROGRESS_INCOMPLETE
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = null

    set trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_WarsongCamp)
    call TriggerAddCondition(trig, Condition(function Conditions))
    call TriggerAddAction(trig, function EntersRegion)

    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, TIMER, false)
    call TriggerAddCondition(trig, Condition(function Conditions))
    call TriggerAddAction(trig, function Build)    

    set trig = CreateTrigger()
    call OnPersonFactionChange.register(trig)
    call TriggerAddCondition(trig, Condition(function Conditions))
    call TriggerAddAction(trig, function PersonFactionChanges)

    //Quest setup
    set QUEST_CAMP = QuestData.create("Warsong Camp", "The forests of Ashenvale seem to be an untapped resource. Establish a foothold there.", "Grommash has established a foothold in Ashenvale and is now ready to begin harvesting supplies in earnest.", "ReplaceableTextures\\CommandButtons\\BTNMercenaryCamp.blp")
    set QUESTITEM_BUILD = QUEST_CAMP.addItem("Survive until turn 4 OR bring Grom to Ashenvale")
    call FACTION_WARSONG.addQuest(QUEST_CAMP)
  endfunction

endlibrary