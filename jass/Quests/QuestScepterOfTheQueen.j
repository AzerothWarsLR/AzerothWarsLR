library QuestScepterOfTheQueen initializer OnInit requires QuestData, Environment, FrostwolfConfig, WarsongConfig, SentinelsConfig, DruidsConfig, ArtifactConfig

  globals
    private QuestData QUEST_SCEPTER_HORDE
    private QuestItemData QUESTITEM_KILL_FEATHERMOON
    private QuestItemData QUESTITEM_VISIT_HORDE

    private QuestData QUEST_SCEPTER_NE
    private QuestItemData QUESTITEM_KILL_STONEMAUL
    private QuestItemData QUESTITEM_VISIT_NE

    private Set NightElvenFactions
    private Set HordeFactions
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

  private function HordeVictory takes player whichPlayer returns nothing
    local integer i = 0
    local group tempGroup = CreateGroup()
    local unit u

    //Transfer artifact
    call SetItemPosition(Artifact(Artifact.artifactsByType['I00I']).item, GetRectCenterX(gg_rct_HighBourne), GetRectCenterY(gg_rct_HighBourne))
    //Give passive units to hostile
    call GroupEnumUnitsInRect(tempGroup, gg_rct_HighBourne, null)
    loop
      set u = FirstOfGroup(tempGroup)
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call SetUnitOwner(u, Player(PLAYER_NEUTRAL_AGGRESSIVE), true)
        call SetUnitInvulnerable(u, false)
      endif
      call GroupRemoveUnit(tempGroup, u)
      exitwhen u == null
    endloop
    
    //Quest updates
    loop
      exitwhen i == HordeFactions.size
      call Faction(HordeFactions[i]).setQuestItemProgress(QUESTITEM_VISIT_HORDE, QUEST_PROGRESS_COMPLETE, true)
      set i = i + 1
    endloop
    set i = 0
    loop
      exitwhen i == NightElvenFactions.size
      call Faction(NightElvenFactions[i]).setQuestItemProgress(QUESTITEM_VISIT_NE, QUEST_PROGRESS_FAILED, true)
      set i = i + 1
    endloop
  endfunction

  private function NightElfVictory takes player whichPlayer returns nothing
    local integer i = 0
    local group tempGroup = CreateGroup()
    local unit u
    
    //Transfer artifact
    call SetItemPosition(Artifact(Artifact.artifactsByType['I00I']).item, GetRectCenterX(gg_rct_HighBourne), GetRectCenterY(gg_rct_HighBourne))
    //Transfer control of passive units
    call GroupEnumUnitsInRect(tempGroup, gg_rct_HighBourne, null)
    loop
      set u = FirstOfGroup(tempGroup)
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call UnitRescue(u, whichPlayer)
      endif
      call GroupRemoveUnit(tempGroup, u)
      exitwhen u == null
    endloop

    //Quest updates
    call FACTION_SENTINELS.setQuestItemProgress(QUESTITEM_VISIT_NE, QUEST_PROGRESS_COMPLETE, true)
    call FACTION_SENTINELS.setQuestItemProgress(QUESTITEM_VISIT_HORDE, QUEST_PROGRESS_FAILED, true)

    //Cleanup
    call DestroyGroup(tempGroup)
    set tempGroup = null
  endfunction

  private function EntersRegion takes nothing returns nothing
    local Person triggerPerson = Persons[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))]
    local integer i = 0

    if not UnitAlive(gg_unit_o004_0169) then //Stonemaul
      loop
      exitwhen i == NightElvenFactions.size
        if triggerPerson.team.containsPlayer(Faction(NightElvenFactions[i]).whichPerson.p) then
          call NightElfVictory(Faction(NightElvenFactions[i]).whichPerson.p)
          call DestroyTrigger(GetTriggeringTrigger())
          return
        endif
        set i = i + 1
      endloop
    set i = 0
    elseif not UnitAlive(gg_unit_e00M_2545) then //Feathermoon
      loop
      exitwhen i == HordeFactions.size
        if triggerPerson.team.containsPlayer(Faction(HordeFactions[i]).whichPerson.p) then
          call HordeVictory(Faction(HordeFactions[i]).whichPerson.p)
          call DestroyTrigger(GetTriggeringTrigger())
          return
        endif
        set i = i + 1
      endloop
    endif
  endfunction

  private function StonemaulDies takes nothing returns nothing
    local integer i = 0
    loop
      exitwhen i == NightElvenFactions.size
      call Faction(NightElvenFactions[i]).setQuestItemProgress(QUESTITEM_KILL_STONEMAUL, QUEST_PROGRESS_COMPLETE, true)
      set i = i + 1
    endloop
  endfunction

  private function FeathermoonDies takes nothing returns nothing
    local integer i = 0
    loop
      exitwhen i == HordeFactions.size
      call Faction(HordeFactions[i]).setQuestItemProgress(QUESTITEM_KILL_FEATHERMOON, QUEST_PROGRESS_COMPLETE, true)
      set i = i + 1
    endloop
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    local integer i
    local group tempGroup
    local unit u

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_o004_0169, EVENT_UNIT_DEATH )
    call TriggerAddAction( trig, function StonemaulDies )

    set trig = CreateTrigger()
    call TriggerRegisterUnitEvent( trig, gg_unit_e00M_2545, EVENT_UNIT_DEATH )
    call TriggerAddAction( trig, function FeathermoonDies )

    set trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple( trig, gg_rct_HighBourne )
    call TriggerAddAction( trig, function EntersRegion )

    //Sets of factions eligible for these quests
    set HordeFactions = Set.create()
    call HordeFactions.add(FACTION_WARSONG)
    call HordeFactions.add(FACTION_FROSTWOLF)
    set NightElvenFactions = Set.create()
    call NightElvenFactions.add(FACTION_SENTINELS)

    //Horde quest setup
    set QUEST_SCEPTER_HORDE = QuestData.create("Royal Plunder", "Remnants of the ancient Highborne survive within the ruins of Dire Maul. If Feathermoon Stronghold falls, it would become a simple matter to slaughter the Highborne and plunder their artifacts.", "The Highborne are no longer implicitly defended by the Night Elven presence at Feathermoon Stronghold. The Horde unleashes their full might against these Night Elven arcanists.", "ReplaceableTextures\\CommandButtons\\BTNNagaWeaponUp2.blp")
    set QUESTITEM_KILL_FEATHERMOON = QUEST_SCEPTER_HORDE.addItem("Destroy Feathermoon Stronghold")
    set QUESTITEM_VISIT_HORDE = QUEST_SCEPTER_HORDE.addItem("Bring a unit to Eldre'thalas")
    set i = 0
    loop
      exitwhen i == HordeFactions.size
      call Faction(HordeFactions[i]).addQuest(QUEST_SCEPTER_HORDE)
      set i = i + 1
    endloop

    //Night elf quest setup
    set QUEST_SCEPTER_NE = QuestData.create("Return to the Fold", "Remnants of the ancient Highborne survive within the ruins of Dire Maul. If Stonemaul falls, it would be safe for them to come out.", "The Shen'dralar, the Highborne survivors of the Sundering, swear allegiance to their fellow Night Elves. As a sign of their loyalty, they offer up an artifact they have guarded for thousands of years: the Scepter of the Queen.", "ReplaceableTextures\\CommandButtons\\BTNNagaWeaponUp2.blp")
    set QUESTITEM_KILL_STONEMAUL = QUEST_SCEPTER_NE.addItem("Destroy Stonemaul Keep")
    set QUESTITEM_VISIT_NE = QUEST_SCEPTER_NE.addItem("Bring a unit to Eldre'thalas")
    call FACTION_SENTINELS.addQuest(QUEST_SCEPTER_NE)

    //Make the Shen'dralar starting units invulnerable
    set tempGroup = CreateGroup()
    call GroupEnumUnitsInRect(tempGroup, gg_rct_HighBourne, null)
    loop
      set u = FirstOfGroup(tempGroup)
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call SetUnitInvulnerable(u, true)
      endif
      call GroupRemoveUnit(tempGroup, u)
      exitwhen u == null
    endloop
  endfunction

endlibrary