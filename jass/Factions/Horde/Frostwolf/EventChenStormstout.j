//Chen Stormstout is a demihero that, when approached by someone with Warsong or True Horde in their team, is given to Warsong or True Horde.
//If Chen is approached and neither of those Factions are in the game, Frostwolves and New Horde become eligible as well.
//If Warsong or True Horde has Chen when they leave, and Frostwolves or New Horde are in the game, transfer Chen. 

library EventChenStormstout initializer OnInit requires Persons

  globals
    private Set PrimaryEligibleFactions
    private Set SecondaryEligibleFactions
    private Person ChenOwner
    private constant integer CHEN_RESEARCH = 0
  endglobals

  private function EnableUnitForPlayer takes unit u, player p returns nothing
    call ShowUnit(u, true)
    call SetUnitInvulnerable(u, false)
    call SetUnitOwner(u, p, true)
  endfunction

  private function PersonGrantChen takes Person whichPerson returns nothing
    call DisplayTextToForce(whichPerson.team.players, "Chen has joined the " + whichPerson.faction.prefixCol + whichPerson.faction.name + "|r.")
    call SetPlayerTechResearched(whichPerson.p, CHEN_RESEARCH, 1)
    set ChenOwner = whichPerson
    call EnableUnitForPlayer(gg_unit_Nsjs_2670, whichPerson.p) //Chen Stormstout
  endfunction

  private function EntersRegion takes nothing returns nothing
    local Person triggerPerson = Persons[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]
    local Person tempPerson
    local integer i = 0
    if ChenOwner == 0 then
      //If the entering unit is in the same team as a Primary Eligible Faction, give Chen to the first player from that group
      loop
        exitwhen i == PrimaryEligibleFactions.size
        set tempPerson = PersonsByFaction[PrimaryEligibleFactions[i]]
        if triggerPerson.team.containsPlayer(tempPerson.p) and ChenOwner != tempPerson then
          call PersonGrantChen(tempPerson)
          return
        endif
      endloop
    else
      //Failing that, try it for Secondary Eligible Factions instead
      set i = 0
      loop
        exitwhen i == PrimaryEligibleFactions.size
        set tempPerson = PersonsByFaction[PrimaryEligibleFactions[i]]
          if triggerPerson.team.containsPlayer(tempPerson.p) and ChenOwner != tempPerson then
            call PersonGrantChen(tempPerson)
            return
          endif
      endloop
    endif
  endfunction

  //If a Primary faction has Chen, grant Chen to a secondary eligible faction - don't care about teams this time
  private function PersonFactionChanges takes nothing returns nothing
    local Person triggerPerson = GetTriggerPerson()
    local integer i = 0
    local Person tempPerson
    if ChenOwner != triggerPerson and PrimaryEligibleFactions.contains(triggerPerson.faction) then
      loop
        exitwhen i == SecondaryEligibleFactions.size
        set tempPerson = PersonsByFaction[SecondaryEligibleFactions[i]]
        if tempPerson != 0 then
          call PersonGrantChen(tempPerson)
          return
        endif 
        set i = i + 1
      endloop
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = null

    set trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_Chen)
    call TriggerAddAction(trig, function EntersRegion)  

    set trig = CreateTrigger()
    call OnPersonFactionChange.register(trig)
    call TriggerAddAction(trig, function PersonFactionChanges)  

    set PrimaryEligibleFactions = Set.create()
    call PrimaryEligibleFactions.add(FACTION_WARSONG)
    call PrimaryEligibleFactions.add(FACTION_TRUE_HORDE)  

    set SecondaryEligibleFactions = Set.create()
    call SecondaryEligibleFactions.add(FACTION_FROSTWOLF)
    call SecondaryEligibleFactions.add(FACTION_NEW_HORDE)
  endfunction
endlibrary