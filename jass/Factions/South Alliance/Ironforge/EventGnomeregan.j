library EventGnomeregan initializer OnInit

  private function Actions takes nothing returns nothing
    local group tempGroup = CreateGroup()
    local unit u
    local Person tempPerson = 0
    local player recipient = Player(PLAYER_NEUTRAL_AGGRESSIVE)

    if PersonsByFaction[FACTION_IRONFORGE] != 0 then                        //Ironforge
      set tempPerson = PersonsByFaction[FACTION_IRONFORGE]
      set recipient = tempPerson.getPlayer()
    elseif PersonsByFaction[FACTION_STORMWIND] != 0 then                   //Stormwind
      set tempPerson = PersonsByFaction[FACTION_STORMWIND]                 
      set recipient = tempPerson.getPlayer()                                 
    endif

    //Transfer all Neutral Passive units in Gnomeregan to one of the above factions
    call GroupEnumUnitsInRect(tempGroup, gg_rct_Gnomergan, null)
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
    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "The Gnomish enemies have been defeated and Gnomergan is liberated, but the Tinkers stayed behind to repair the city.")      

    //Cleanup
    call DestroyGroup (TempGroup)
    call DestroyTrigger(GetTriggeringTrigger())      
    set recipient = null
    set tempGroup = null        
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterUnitEvent(trig, gg_unit_nitw_1513, EVENT_UNIT_DEATH)        //Ice Troll Warlord
    call TriggerAddCondition(trig, Condition(function Actions))
  endfunction        

endlibrary