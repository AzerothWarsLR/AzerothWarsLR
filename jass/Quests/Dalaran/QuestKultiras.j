library QuestKultiras initializer OnInit requires QuestData, DetermineLevel, DalaranConfig

  globals
    private constant real TIMER = 540.

    private QuestData QUEST_KULTIRAS
    private QuestItemData QUESTITEM_KULTIRAS
  endglobals

  private function TimerEnds takes nothing returns nothing
    local group tempGroup = CreateGroup()
    local unit u = null
    local player recipient = Player(PLAYER_NEUTRAL_AGGRESSIVE)
    local Person dalaranPerson = FACTION_DALARAN.whichPerson

    if dalaranPerson != 0 then
      set recipient = dalaranPerson.p
      call FACTION_DALARAN.setQuestItemStatus(QUESTITEM_KULTIRAS, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_DALARAN.setQuestItemStatus(QUESTITEM_KULTIRAS, QUEST_PROGRESS_FAILED, true)
    endif

    //Level Admiral Proudmoore
    call ShowUnit(gg_unit_Hapm_1060, true)
    call UnitDetermineLevel(gg_unit_Hapm_1060, 1.0)

    //Reveal and grant all units in Kul'tiras
    call GroupEnumUnitsInRect(tempGroup, gg_rct_Kultiras, null)
    loop
      set u = FirstOfGroup(tempGroup)
      exitwhen u == null
      if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
        call SetUnitOwner(u, recipient, true)
        call ShowUnit(u, true)
        call SetUnitInvulnerable(u, false)
      endif
      call GroupRemoveUnit(tempGroup, u)
    endloop

    //Remove pathing blockers
    call RemoveDestructable( gg_dest_B011_23621 )
    call RemoveDestructable( gg_dest_B011_23622 )
    call RemoveDestructable( gg_dest_B00A_23623 )
    call RemoveDestructable( gg_dest_B011_23624 )
    call RemoveDestructable( gg_dest_B00A_23625 )

    //Cleanup
    call DestroyGroup(tempGroup)
    set tempGroup = null
    set recipient = null
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, TIMER, false)
    call TriggerAddAction(trig, function TimerEnds)  

    set QUEST_KULTIRAS = QuestData.create("The City at Sea", "The independent nation of Kul'tiras is conspicuously absent from the Second War. Hopefully they arrive soon.", "Admiral Daelin Prodmoore has finally mobilized Kul'tiras for war, and is now ready to aid Alliance forces on the mainland.", "ReplaceableTextures\\CommandButtons\\BTNProudmoore.blp")
    set QUESTITEM_KULTIRAS = QUEST_KULTIRAS.addItem("Survive until turn 9")
    call FACTION_DALARAN.addQuest(QUEST_KULTIRAS) 
    set FACTION_DALARAN.StartingQuest = QUEST_KULTIRAS
  endfunction

endlibrary