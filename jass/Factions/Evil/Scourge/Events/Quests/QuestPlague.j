library QuestPlague initializer OnInit requires QuestData, ScourgeConfig

  globals
    private QuestData QUEST_PLAGUE
    private QuestItemData QUESTITEM_PLAGUETIME
    private QuestItemData QUESTITEM_PLAGUESTART

    private boolean Enabled = false

    private constant string COMMAND = "-plague"
    private constant real DELAY_TIMER = 420.
    private constant real FORCED_TIMER = 720.
  endglobals

  private function Plague takes nothing returns nothing
    local Person scourgePerson = FACTION_SCOURGE.whichPerson
    if scourgePerson != 0 and Enabled then
      call TriggerExecute( gg_trg_Plague_Actions )
      call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_PLAGUESTART, QUEST_PROGRESS_COMPLETE, true)
    else
      call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_PLAGUESTART, QUEST_PROGRESS_FAILED, true)
    endif
    set Enabled = false
  endfunction

  private function Enable takes nothing returns nothing
    call FACTION_SCOURGE.setQuestItemStatus(QUESTITEM_PLAGUETIME, QUEST_PROGRESS_COMPLETE, true)
    set Enabled = true
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    local integer i
    set QUEST_PLAGUE = QuestData.create("Plague of Undeath", "From turn 5, you can type -plague to unleash a devastating zombifying plague across the lands of Lordaeron. Once it's started, you can type -off to deactivate Cauldron Zombie spawns. Type -end to stop citizens from turning into zombies.", "The plague has been unleashed!", "ReplaceableTextures\\CommandButtons\\BTNPlagueCloud.blp")
    set QUESTITEM_PLAGUETIME = QUEST_PLAGUE.addItem("Survive until turn 6")
    set QUESTITEM_PLAGUESTART = QUEST_PLAGUE.addItem("Type -plague OR wait until turn 11")
    call FACTION_SCOURGE.addQuest(QUEST_PLAGUE)

    //Command to start the Plague after it's enabled
    set trig = CreateTrigger()
    set i = 0
    loop
    exitwhen i > MAX_PLAYERS
      call TriggerRegisterPlayerChatEvent( trig, Player(i), COMMAND, true )
      set i = i + 1
    endloop   
    call TriggerAddCondition( trig, Condition(function Plague) )

    //Enable the Plague after timer
    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, DELAY_TIMER, false)
    call TriggerAddAction(trig, function Enable)  

    //Force the Plague to start after timer
    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, FORCED_TIMER, false)
    call TriggerAddAction(trig, function Plague)  

  endfunction

endlibrary