//If Thrall enters the Orgrimmar area, OR a time elapses, OR someone becomes a solo Horde Path, give Orgrimmar to a Horde player.

library Build initializer OnInit requires Persons, WarsongConfig, FrostwolfConfig, NewHordeConfig, TrueHordeConfig

  globals
    private constant real ORGRIMMAR_TIMER = 600.     //How long it takes for Orgrimmar to be built instantly
    private constant integer GOLD = 100
    private constant integer LUMBER = 350
    private boolean Built = false
  endglobals

  private function Build takes nothing returns nothing
    local group tempGroup = CreateGroup()
    local unit u
    local Person tempPerson = 0
    local player recipient = Player(PLAYER_NEUTRAL_AGGRESSIVE)

    set Built = true

    if PersonsByFaction[FACTION_FROSTWOLF] != 0 then                 
      set tempPerson = PersonsByFaction[FACTION_FROSTWOLF]
      set recipient = tempPerson.p
    elseif PersonsByFaction[FACTION_WARSONG] != 0 then
      set tempPerson = PersonsByFaction[FACTION_WARSONG]
      set recipient = tempPerson.p
    elseif PersonsByFaction[FACTION_NEW_HORDE] != 0 then
      set tempPerson = PersonsByFaction[FACTION_NEW_HORDE]
      set recipient = tempPerson.p      
    elseif PersonsByFaction[FACTION_TRUE_HORDE] != 0 then
      set tempPerson = PersonsByFaction[FACTION_TRUE_HORDE]
      set recipient = tempPerson.p  
    endif

    //Transfer all Neutral Passive units in Orgrimmar to one of the above factions
    call GroupEnumUnitsInRect(tempGroup, gg_rct_Orgrimmar, null)
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
    //Give resources and display message
    call AdjustPlayerStateBJ(GOLD, recipient, PLAYER_STATE_RESOURCE_GOLD )
    call AdjustPlayerStateBJ(LUMBER, recipient, PLAYER_STATE_RESOURCE_LUMBER )  
    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Thrall has established Orgrimmar.")      

    //Cleanup
    call DestroyGroup (TempGroup)
    set recipient = null
    set tempGroup = null
  endfunction

  private function TimerEnds takes nothing returns nothing
    call Build()
  endfunction

  private function EntersRegion takes nothing returns nothing
    if GetUnitTypeId(GetTriggerUnit()) == 'Othr' then   //This is Thrall
      call Build()
    endif
  endfunction    

  private function PersonFactionChanges takes nothing returns nothing
    if GetTriggerPerson().faction == FACTION_NEW_HORDE or GetTriggerPerson().faction == FACTION_TRUE_HORDE then
      call Build()
    endif
  endfunction

  private function Conditions takes nothing returns boolean
    return not Built
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = null

    set trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_Orgrimmar)
    call TriggerAddCondition(trig, Condition(function Conditions))
    call TriggerAddAction(trig, function EntersRegion)

    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, ORGRIMMAR_TIMER, false)
    call TriggerAddCondition(trig, Condition(function Conditions))
    call TriggerAddAction(trig, function TimerEnds)  

    set trig = CreateTrigger()
    call OnPersonFactionChange.register(trig)
    call TriggerAddCondition(trig, Condition(function Conditions))
    call TriggerAddAction(trig, function PersonFactionChanges)    
  endfunction

endlibrary