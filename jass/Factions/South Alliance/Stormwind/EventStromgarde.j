library EventStromgarde initializer OnInit requires Persons, Faction, DetermineLevel

  globals
    private trigger TriggerEntersRegion = null
    private trigger TriggerDies = null
    private trigger TriggerResearch = null
  endglobals

  private function Build takes nothing returns nothing
    local group tempGroup = CreateGroup()
    local unit u
    local Person tempPerson = 0
    local player recipient = Player(PLAYER_NEUTRAL_AGGRESSIVE)

    if PersonsByFaction[10] != 0 then                    //Stormwind
      set tempPerson = PersonsByFaction[10]
      set recipient = tempPerson.getPlayer()                          
    endif

    //If recipient is Stormwind, level Galen, otherwise delete him
    if Persons[GetPlayerId(recipient)].faction == FACTION_STORMWIND then
      call UnitDetermineLevel( gg_unit_H00Z_1936, 1.0 )
    else
      call RemoveUnit(gg_unit_H00Z_1936)           
    endif

    //Transfer all Neutral Passive units in Stromgarde to one of the above factions
    call GroupEnumUnitsInRect(tempGroup, gg_rct_Stromgarde, null)
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
    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "The nation of Stromgarde has been mobilized for war.")      

    //Cleanup
    call DestroyGroup (TempGroup)
    call DestroyTrigger(TriggerEntersRegion)      
    call DestroyTrigger(TriggerDies)  
    call DestroyTrigger(TriggerResearch)
    set recipient = null
    set tempGroup = null
  endfunction

  private function Dies takes nothing returns nothing
    if GetUnitTypeId(GetTriggerUnit()) == 'h00X' then
      call Build()
    endif
  endfunction

  private function EntersRegion takes nothing returns nothing
    if GetUnitTypeId(GetTriggerUnit()) == 'H00R' or GetUnitTypeId(GetTriggerUnit()) == 'h05Y' or GetUnitTypeId(GetTriggerUnit()) == 'h03W' then   //Varian, Bolvar or Danath
      call Build()
    endif
  endfunction    

  private function Research takes nothing returns nothing
    if GetResearched() == 'R03V' then
      call Build()
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    set TriggerEntersRegion = CreateTrigger()
    call TriggerRegisterEnterRectSimple(TriggerEntersRegion, gg_rct_Stromgarde)
    call TriggerAddCondition(TriggerEntersRegion, Condition(function EntersRegion))

    set TriggerDies = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( TriggerDies, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition(TriggerDies, Condition(function Dies))    

    set TriggerResearch = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( TriggerResearch, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(TriggerResearch, Condition(function Research))            
  endfunction

endlibrary