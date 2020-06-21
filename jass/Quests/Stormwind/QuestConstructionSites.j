//Stormwind's Construction sites are enabled after a delay.

library QuestConstructionSites initializer OnInit requires QuestData, StormwindConfig

  globals
    private constant real TIMER = 360.
    private QuestItemData QUESTITEM_WAIT
    private constant integer RESEARCH_ID = 'R022'
  endglobals

  private function TimerEnds takes nothing returns nothing
    if FACTION_STORMWIND.Person != 0 then
      call FACTION_STORMWIND.setQuestItemStatus(QUESTITEM_WAIT, QUEST_PROGRESS_COMPLETE, true)
      if GetLocalPlayer() == FACTION_STORMWIND.Person.p then
        call PingMinimap(GetUnitX(gg_unit_h053_1121), GetUnitY(gg_unit_h053_1121), 5)
        call PingMinimap(GetUnitX(gg_unit_h055_0035), GetUnitY(gg_unit_h055_0035), 5)
      endif
      call SetPlayerTechResearched(FACTION_STORMWIND.Person.p, RESEARCH_ID, 1)
    else
      call FACTION_STORMWIND.setQuestItemStatus(QUESTITEM_WAIT, QUEST_PROGRESS_UNDISCOVERED, false)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local QuestData tempQuest
    local trigger trig = CreateTrigger(  )
    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, TIMER, false)
    call TriggerAddAction(trig, function TimerEnds)  

    set tempQuest = QuestData.create("Inevitable Progress", "Stormwind has not yet fully recovered from the ravaging it experienced during the Second War. Await reconstruction.", "Stormwind's Construction Sites are now ready to be upgraded.", "ReplaceableTextures\\CommandButtons\\BTNGenericHumanBuilding.blp")
    set QUESTITEM_WAIT = tempQuest.addItem("Survive until turn " + I2S(R2I((TIMER / 60)+1)))
    call FACTION_STORMWIND.addQuest(tempQuest) 
    call FACTION_STORMWIND.registerObjectLimit(RESEARCH_ID, UNLIMITED)
  endfunction

endlibrary