library PathCthun initializer OnInit requires AhnqirajConfig, TeamConfig, ControlPoint, ArtifactConfig

  globals
    private group AhnQirajGroup = null

    private constant integer RESEARCH_ID = 'R04A'
  endglobals

  private function Research takes nothing returns nothing
    local Person triggerPerson = 0
    local player triggerPlayer = null
    local group tempGroup = null
    local group tempGroupB = null
    local unit u = null
    local integer i = 0
    local Artifact tempArtifact = 0
    if GetResearched() == RESEARCH_ID then
      //Apply Person changes
      set triggerPlayer = GetTriggerPlayer()
      set triggerPerson = Persons[GetPlayerId(triggerPlayer)]
      call triggerPerson.leave()
      call triggerPerson.setFaction(FACTION_AHNQIRAJ)
      call triggerPerson.setTeam(TEAM_AHNQIRAJ)

      //Deal with units already in Ahn'qiraj.
      set tempGroup = CreateGroup()
      set tempGroupB = CreateGroup()
      call GroupEnumUnitsInRect(tempGroup, gg_rct_AhnQiraj, null)
      call GroupEnumUnitsInRect(tempGroupB, gg_rct_InstanceAhnqiraj, null)
      call BlzGroupAddGroupFast(tempGroupB, tempGroup)

      loop
      exitwhen BlzGroupGetSize(tempGroup) == 0
        set u = FirstOfGroup(tempGroup)
        if not IsUnitInGroup(u, ControlPoints) then
          if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_AGGRESSIVE) or IsUnitType(u, UNIT_TYPE_STRUCTURE) or IsUnitType(u, UNIT_TYPE_ANCIENT) then
            call KillUnit(u)
            call RemoveUnit(u)
          else
            call SetUnitPosition(u, -17410, -13500)
          endif
        endif
      call GroupRemoveUnit(tempGroup, u)
      endloop
      call DestroyGroup(tempGroup)
      call DestroyGroup(tempGroupB)
      set tempGroup = null
      set tempGroupB = null
      set u = null            
      
      //Transfer C'thun unit ownership to trigger player
      loop
        exitwhen BlzGroupGetSize(AhnQirajGroup) == 0
        set u = FirstOfGroup(AhnQirajGroup)
        call ShowUnit(u, true)
        call SetUnitInvulnerable(u, false)
        call SetUnitOwner(u, triggerPlayer, true)
        call GroupRemoveUnit(AhnQirajGroup, u)
      endloop

      //Give resources, display message, and spawn C'thun himself
      call SetPlayerState(triggerPlayer, PLAYER_STATE_RESOURCE_GOLD, 3000)
      call SetPlayerState(triggerPlayer, PLAYER_STATE_RESOURCE_LUMBER, 2500)
      call DisplayTextToForce(GetPlayersAll(), "The gates of Ahn'qiraj have been opened. The planetary parasite known as C'thun has set his maddening gaze on Azeroth once more, prompting the denizens of Kalimdor to ready their forces for conflict against the renewed Qiraji invasion.")
      set u = CreateUnit(triggerPlayer, 'U00R', -18635.6, -23677.9, 0)
      call UnitAddItem(u, CreateItem('stel', GetUnitX(u), GetUnitY(u)))
      call SetHeroLevel(u, 10, false)
      
      set u = null

      //Transfer C'thun's artifact to a hero
      set tempArtifact = Artifact.artifactsByType['I00F']
      if tempArtifact != 0 and tempArtifact.owningUnit == null then
        call UnitAddItem(gg_unit_E005_3731, tempArtifact.item)
      endif

      //Disable C'thun for all players (THIS SHOULD JUST BE A SYSTEM)
      loop
      exitwhen i > MAX_PLAYERS
        call SetPlayerTechMaxAllowed(Player(i), RESEARCH_ID, 0)
        set i = i + 1
      endloop

      //Cleanup
      set triggerPlayer = null
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    local group groupInside = CreateGroup()
    local group groupOutside = CreateGroup()
    local unit u = null
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition( trig, Condition(function Research) )   

    //Enumerate preplaced units in Ahnqiraj, hide them, and add them to a Group for later transfer
    set AhnQirajGroup = CreateGroup()
    set groupInside = CreateGroup()
    call GroupEnumUnitsInRect(groupInside, gg_rct_InstanceAhnqiraj, null)
    set groupOutside = CreateGroup()
    call GroupEnumUnitsInRect(groupOutside, gg_rct_AhnQiraj, null)

    loop
      set u = FirstOfGroup(groupInside)
      exitwhen u == null
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call GroupAddUnit(AhnQirajGroup, u)
        call ShowUnit(u, false)
      endif
      call GroupRemoveUnit(groupInside, u)
    endloop

    loop
      set u = FirstOfGroup(groupOutside)
      exitwhen u == null
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call GroupAddUnit(AhnQirajGroup, u)
        call ShowUnit(u, false)
      endif
      call GroupRemoveUnit(groupOutside, u)
    endloop

    call DestroyGroup(groupInside)
    call DestroyGroup(groupOutside)
  endfunction

endlibrary