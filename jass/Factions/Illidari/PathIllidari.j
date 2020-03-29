library PathIllidari initializer OnInit requires IllidariConfig, TeamConfig, ArtifactConfig

  globals
    private group IllidariUnits
    private constant integer RESEARCH_ID = 'R049'
  endglobals

  private function Research takes nothing returns nothing
    local player triggerPlayer = GetTriggerPlayer()
    local Person triggerPerson = Persons[GetPlayerId(GetTriggerPlayer())]
    local unit u = null
    local integer i = 0
    local group tempGroup
    if GetResearched() == RESEARCH_ID then
      //Faction
      call triggerPerson.setFaction(FACTION_ILLIDARI)
      call triggerPerson.setTeam(TEAM_ILLIDARI)

      //Rescue
      loop
        set u = FirstOfGroup(IllidariUnits)
        exitwhen u == null
        call UnitRescue(u, triggerPlayer)
        call GroupRemoveUnit(IllidariUnits, u)
      endloop

      //Evacuate
      set tempGroup = CreateGroup()
      call GroupEnumUnitsInRect(tempGroup, gg_rct_TempestKeep, null)
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if GetOwningPlayer(u) != triggerPlayer then
          if IsUnitType(u, UNIT_TYPE_STRUCTURE) then
            call KillUnit(u)
          else
            call SetUnitPosition(u, GetRectCenterX(gg_rct_Tempest_Keep_Evacuate), GetRectCenterY(gg_rct_Tempest_Keep_Evacuate))
          endif
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop
      call DestroyGroup(tempGroup)

      //Heroes
      set LEGEND_ILLIDAN.UnitType = 'Eevi'
      call LEGEND_ILLIDAN.Spawn(triggerPlayer, GetRectCenterX(gg_rct_EvilIllidanSpawn), GetRectCenterY(gg_rct_EvilIllidanSpawn), 200)
      call UnitDetermineLevel(LEGEND_AKAMA.Unit, 1.)
      call UnitDetermineLevel(LEGEND_KAEL.Unit, 1.)
      call UnitDetermineLevel(LEGEND_VASHJ.Unit, .1)
      call SetItemPosition(ARTIFACT_SKULLOFGULDAN.item, GetRectCenterX(gg_rct_EvilIllidanSpawn), GetRectCenterY(gg_rct_EvilIllidanSpawn))
      call ARTIFACT_SKULLOFGULDAN.setStatus(ARTIFACT_STATUS_GROUND)

      //Resources
      call SetPlayerState(triggerPlayer, PLAYER_STATE_RESOURCE_GOLD, R2I(GetGameTime() * 2))
      call SetPlayerState(triggerPlayer, PLAYER_STATE_RESOURCE_LUMBER, 4000)

      //Upgrades
      call SetPlayerTechResearched(triggerPlayer, 'R046', 1)
      call SetPlayerTechResearched(triggerPlayer, 'Rhpt', 2)
      call SetPlayerTechResearched(triggerPlayer, 'R009', 0)

      //Disable upgrades for other players
      loop
      exitwhen i > MAX_PLAYERS
        call SetPlayerTechMaxAllowed(Player(i), RESEARCH_ID, 0)
        set i = i + 1
      endloop

      //Cleanup
      set triggerPlayer = null
      call DestroyGroup(IllidariUnits)
      call DestroyTrigger(GetTriggeringTrigger())
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    local unit u = null
    local group tempGroup = CreateGroup()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition( trig, Condition(function Research) )   

    set IllidariUnits = CreateGroup()

    set tempGroup = CreateGroup()
    call GroupEnumUnitsInRect(tempGroup, gg_rct_TempestKeep, null)
    loop
      set u = FirstOfGroup(tempGroup)
      exitwhen u == null
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call GroupAddUnit(IllidariUnits, u)
        call ShowUnit(u, false)
        call SetUnitInvulnerable(u, true)
      endif
      call GroupRemoveUnit(tempGroup, u)
    endloop
  endfunction

endlibrary