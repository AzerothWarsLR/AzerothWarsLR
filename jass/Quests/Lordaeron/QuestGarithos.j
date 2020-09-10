//Garithos is spawned spawns after a timer expires.

library EventGarithosSpawn initializer OnInit requires QuestData, LordaeronConfig, LegendLordaeron

  globals
    private constant real TIMER = 960.
    private QuestData QUEST_GARITHOS
    private QuestItemData QUESTITEM_GARITHOS
  endglobals

  private function TimerEnds takes nothing returns nothing
    if FACTION_LORDAERON.Person != 0 then
      call LEGEND_GARITHOS.Spawn(FACTION_LORDAERON.Player, GetRectCenterX(gg_rct_Garithos), GetRectCenterY(gg_rct_Garithos), 270)
      call UnitDetermineLevel(LEGEND_GARITHOS.Unit, 1.00)
      call CreateUnits(FACTION_LORDAERON.Player, 'hkni', GetRectCenterX(gg_rct_Garithos), GetRectCenterY(gg_rct_Garithos), 270, 24)
      call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_GARITHOS, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_LORDAERON.setQuestItemProgress(QUESTITEM_GARITHOS, QUEST_PROGRESS_UNDISCOVERED, false)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger(  )
    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, TIMER, false)
    call TriggerAddAction(trig, function TimerEnds)  

    set QUEST_GARITHOS = QuestData.create("The Grand Marshal", "The Kingdom of Lordaeron is in a dire situation. Grand Marshal Othmar Garithos is on his way, accompanied by a small army.", "Grand General Othmar Garithos has finally arrived with reinforcements.", "ReplaceableTextures\\CommandButtons\\BTNGarithos.blp")
    set QUESTITEM_GARITHOS = QUEST_GARITHOS.addItem("Survive until turn 17")
    call FACTION_LORDAERON.addQuest(QUEST_GARITHOS) 
  endfunction

endlibrary