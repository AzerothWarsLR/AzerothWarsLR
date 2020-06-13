//If any Horde unit enters the Crossroads area, OR a time elapses, OR someone becomes a solo Horde Path, give the Crossroads to a Horde player.

library QuestCrossroads initializer OnInit requires Persons, FrostwolfConfig, WarsongConfig, GeneralHelpers

  globals
    private constant real TIMER = 420.     //How long it takes for this event to elapse automatically

    private QuestData QUEST_CROSSROADS
    private QuestItemData QUESTITEM_VISIT
  endglobals

  private function Build takes nothing returns nothing
    local group tempGroup = CreateGroup()
    local unit u
    local player recipient = Player(PLAYER_NEUTRAL_AGGRESSIVE)

    if FACTION_FROSTWOLF.Person != 0 then                    
      set recipient = FACTION_FROSTWOLF.Person.p  
    elseif FACTION_WARSONG.Person != 0 then
      set recipient = FACTION_WARSONG.Person.p
    endif

    //Transfer all Neutral Passive units in Crossroads to one of the above factions
    call GroupEnumUnitsInRect(tempGroup, gg_rct_CrossroadsOuter, null)
    set u = FirstOfGroup(tempGroup)
    loop
    exitwhen u == null
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call UnitRescue(u, recipient)
      endif
      call GroupRemoveUnit(tempGroup, u)
      set u = FirstOfGroup(tempGroup)
    endloop
    //Give resources and display message
    call CreateUnit(recipient, 'oeye', -12844, -1975, 0)    
    call CreateUnit(recipient, 'oeye', -10876, -2066, 0)   
    call CreateUnit(recipient, 'oeye', -11922, -824, 0)   

    //Complete quests
    call FACTION_FROSTWOLF.setQuestItemStatus(QUESTITEM_VISIT, QUEST_PROGRESS_COMPLETE, true)

    //Cleanup
    call DestroyGroup (TempGroup)
    set recipient = null
    set tempGroup = null
  endfunction

  private function TimerEnds takes nothing returns nothing
    call Build()
  endfunction

  private function EntersRegion takes nothing returns nothing
    if FACTION_FROSTWOLF.Person.Team.containsPlayer(GetOwningPlayer(GetTriggerUnit())) then   //Any Horde faction
      call Build()
    endif
  endfunction    

  private function PersonFactionChanges takes nothing returns nothing
    if GetChangingPersonPrevFaction() == FACTION_FROSTWOLF then
      call Build()
    endif
  endfunction

  private function Conditions takes nothing returns boolean
    return FACTION_FROSTWOLF.getQuestItemProgress(QUEST_CROSSROADS) == QUEST_PROGRESS_INCOMPLETE
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = null

    set trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_Crossroads)
    call TriggerAddCondition(trig, Condition(function Conditions))
    call TriggerAddAction(trig, function EntersRegion)

    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, TIMER, false)
    call TriggerAddCondition(trig, Condition(function Conditions))
    call TriggerAddAction(trig, function TimerEnds)   

    set trig = CreateTrigger()
    call OnPersonFactionChange.register(trig)
    call TriggerAddCondition(trig, Condition(function Conditions))
    call TriggerAddAction(trig, function PersonFactionChanges)    

    //Quest setup
    set QUEST_CROSSROADS = QuestData.create("The Crossroads", "The Horde still needs to establish a strong strategic foothold into Kalimdor. There is an opportune crossroads nearby.", "The Crossroads has been constructed.", "ReplaceableTextures\\CommandButtons\\BTNBarracks.blp")
    set QUESTITEM_VISIT = QUEST_CROSSROADS.addItem("Survive until turn 7 OR bring a unit to the Crossroads")
    call FACTION_FROSTWOLF.addQuest(QUEST_CROSSROADS)
  endfunction

endlibrary