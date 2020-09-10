library QuestTheramore initializer OnInit requires QuestData, DetermineLevel, DalaranConfig

  globals
    private constant real TIMER = 660.

    private QuestData QUEST
    private QuestItemData QUESTITEM_TIME
    private QuestItemData QUESTITEM_VISIT

    private group TheramoreUnits
    private boolean Completed = false
    private boolean TimerEnded = false
  endglobals

  private function Complete takes nothing returns nothing
    local unit u
    local player recipient = Player(PLAYER_NEUTRAL_AGGRESSIVE)
    set Completed = true
    if FACTION_DALARAN.Person != 0 then
      call FACTION_DALARAN.setQuestItemProgress(QUESTITEM_VISIT, QUEST_PROGRESS_COMPLETE, true)
      set recipient = FACTION_DALARAN.Player
    else
      call FACTION_DALARAN.setQuestItemProgress(QUESTITEM_VISIT, QUEST_PROGRESS_FAILED, true)
    endif
    loop
      set u = FirstOfGroup(TheramoreUnits)
      exitwhen u == null
      call UnitRescue(u, recipient)
      call GroupRemoveUnit(TheramoreUnits, u)
    endloop
    call DestroyGroup(TheramoreUnits)
    call DestroyTrigger(GetTriggeringTrigger())
  endfunction

  private function EntersRegion takes nothing returns nothing
    if IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) and Person.ByHandle(GetOwningPlayer(GetTriggerUnit())).Faction == FACTION_DALARAN and TimerEnded and not Completed then
      call Complete()
    endif
  endfunction

  private function TimerEnds takes nothing returns nothing
    set TimerEnded = true
    call FACTION_DALARAN.setQuestItemProgress(QUESTITEM_TIME, QUEST_PROGRESS_COMPLETE, true)
  endfunction

  private function OnPersonFactionChanged takes nothing returns nothing
    if GetChangingPersonPrevFaction() == FACTION_DALARAN and not Completed then
      call Complete()
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig
    local group tempGroup
    local unit u

    set trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, TIMER, false)
    call TriggerAddAction(trig, function TimerEnds)  

    set trig = CreateTrigger()
    call TriggerRegisterEnterRectSimple(trig, gg_rct_Theramore)
    call TriggerAddCondition(trig, Condition(function EntersRegion))

    set trig = CreateTrigger()
    call OnPersonFactionChange.register(trig)
    call TriggerAddAction(trig, function OnPersonFactionChanged)

    set QUEST = QuestData.create("Theramore", "The distant lands of Kalimdor remain untouched by human civilization. If the Third War proceeds poorly, it may become necessary to establish a forward base there.", "A sizeable isle off the coast of Dustwallow Marsh has been colonized and dubbed Theramore, marking the first human settlement to be established on Kalimdor.", "ReplaceableTextures\\CommandButtons\\BTNHumanArcaneTower.blp")
    set QUESTITEM_TIME = QUEST.addItem("Survive until turn 11")
    set QUESTITEM_VISIT = QUEST.addItem("Bring a hero to Theramore")
    call FACTION_DALARAN.addQuest(QUEST) 

    set tempGroup = CreateGroup()
    set TheramoreUnits = CreateGroup()
    call GroupEnumUnitsInRect(tempGroup, gg_rct_Theramore, null)
    loop
      set u = FirstOfGroup(tempGroup)
      exitwhen u == null
      call SetUnitInvulnerable(u, true)
      call SetUnitOwner(u, Player(PLAYER_NEUTRAL_PASSIVE), true)
      call GroupAddUnit(TheramoreUnits, u)
      call GroupRemoveUnit(tempGroup, u)
    endloop
    call DestroyGroup(tempGroup)
  endfunction

endlibrary