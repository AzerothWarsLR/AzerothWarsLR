//If Grom enters the Warsong Camp area, OR a time elapses, OR someone becomes a solo Horde Path, give the Camp to a Horde player.

library QuestWarsongCamp initializer OnInit requires Persons, WarsongConfig, FrostwolfConfig, NewHordeConfig, MannorothConfig

  globals
    private QuestData QUEST_CAMP
    private QuestItemData QUESTITEM_BUILD

    private constant real TIMER = 240.     //How long it takes for Warsong Lumber Camp to be built instantly
    private boolean Built = false
  endglobals

  private function Build takes nothing returns nothing
    local group tempGroup = CreateGroup()
    local unit u
    local Person tempPerson = 0
    local player recipient = Player(PLAYER_NEUTRAL_AGGRESSIVE)

    set Built = true

    if PersonsByFaction[FACTION_WARSONG] != 0 then              
      set tempPerson = PersonsByFaction[FACTION_WARSONG]
      set recipient = tempPerson.p  
    elseif PersonsByFaction[FACTION_FROSTWOLF] != 0 then                   
      set tempPerson = PersonsByFaction[FACTION_FROSTWOLF]
      set recipient = tempPerson.p      
    elseif PersonsByFaction[FACTION_MANNOROTH] != 0 then
      set tempPerson = PersonsByFaction[FACTION_MANNOROTH]
      set recipient = tempPerson.p     
    elseif PersonsByFaction[FACTION_NEW_HORDE] != 0 then
      set tempPerson = PersonsByFaction[FACTION_NEW_HORDE]
      set recipient = tempPerson.p         
    endif

    //Transfer all Neutral Passive units in Orgrimmar to one of the above factions
    call GroupEnumUnitsInRect(tempGroup, gg_rct_WarsongCamp, null)
    set u = FirstOfGroup(tempGroup)
    loop
    exitwhen u == null
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call SetUnitInvulnerable(u, false)
        call SetUnitOwner(u, recipient, true)
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
    if GetTriggerPerson().faction == FACTION_NEW_HORDE or GetTriggerPerson().faction == FACTION_MANNOROTH or GetChangingPersonPrevFaction() == FACTION_WARSONG then
      call Build()
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function Conditions takes nothing returns boolean
    return not Built
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
    set QUESTITEM_BUILD = QUEST_CAMP.addItem("Survive until turn 4 OR bring a unit to Ashenvale")
    call FACTION_WARSONG.addQuest(QUEST_CAMP)
  endfunction

endlibrary