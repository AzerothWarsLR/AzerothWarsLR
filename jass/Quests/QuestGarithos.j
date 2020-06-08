//Garithos is spawned spawns after a timer expires.

library EventGarithosSpawn initializer OnInit requires QuestData, LordaeronConfig, DetermineLevel

  globals
    private constant real TIMER = 960.
    private QuestData QUEST_GARITHOS
    private QuestItemData QUESTITEM_GARITHOS
  endglobals

  private function GarithosSpawn takes nothing returns nothing
    local unit garithos = null
    local real x = 18713
    local real y = 8027
    local Person tempPerson = PersonsByFaction[FACTION_LORDAERON]
    local player p = tempPerson.p
    local integer i = 0       
    set garithos = CreateUnit(p, 'Hlgr', x, y, 270)      //Garithos
    call UnitDetermineLevel(garithos, 1.00)     

    set i = 0
    loop
    exitwhen i > 12
      call CreateUnit(p, 'n03K', x, y, 270)   //Chaplain
      call CreateUnit(p, 'nchp', x, y, 270)   //Cleric
      call CreateUnit(p, 'h01C', x, y, 270)   //Longbowman
      call CreateUnit(p, 'hkni', x, y, 270)   //Knight
      call CreateUnit(p, 'hkni', x, y, 270)   //Knight
      set i = i + 1
    endloop

    set i = 0
    loop
    exitwhen i > 4
      call CreateUnit(p, 'hpea', x, y, 270)   //Peasant
      set i = i + 1
    endloop   

    call FACTION_LORDAERON.setQuestItemStatus(QUESTITEM_GARITHOS, QUEST_PROGRESS_COMPLETE, true)

    //Cleanup
    set garithos = null
  endfunction

  private function TimerEnds takes nothing returns nothing
    local Person lordaeron = PersonsByFaction[FACTION_LORDAERON]
    if lordaeron != 0 then
      call GarithosSpawn()
    else
      call FACTION_LORDAERON.setQuestItemStatus(QUESTITEM_GARITHOS, QUEST_PROGRESS_UNDISCOVERED, false)
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