library QuestData requires Set

  globals
    constant integer QUEST_PROGRESS_UNDISCOVERED = 0
    constant integer QUEST_PROGRESS_INCOMPLETE = 1
    constant integer QUEST_PROGRESS_COMPLETE = 2
    constant integer QUEST_PROGRESS_FAILED = 3

    private constant string SYNC_PREFIX = "GlobalQuestCompleted"  //Used as the sync prefix when global quests are completed and need to be send to every client
  endglobals

  struct QuestItemData
    readonly QuestData parent
    private questitem questItem
    private integer progress
    readonly string desc

    method operator Progress takes nothing returns integer
      return progress
    endmethod

    method setProgress takes integer whichState, boolean display returns nothing
      if progress != whichState then
        set progress = whichState
        if whichState == QUEST_PROGRESS_COMPLETE then
          call QuestItemSetCompleted(questItem, true)
        else
          call QuestItemSetCompleted(questItem, false)
        endif
        call parent.onItemProgressChange(this, display)
      endif
    endmethod

    static method create takes QuestData parent, string desc returns thistype
      local thistype this = thistype.allocate()
      set questItem = QuestCreateItem(parent.quest)
      set this.progress = QUEST_PROGRESS_INCOMPLETE
      set this.parent = parent
      set this.desc = desc
      call QuestItemSetDescription(questItem, desc)
      return this
    endmethod
  endstruct

  struct QuestData
    readonly quest quest
    private integer progress
    readonly string title
    readonly string icon
    readonly string desc
    readonly string completionDesc
    readonly Set questItems
    public boolean Global

    //Display a warning message to everyone EXCEPT the player that completed the quest
    private method displayGlobal takes nothing returns nothing
      local string display = ""
      local integer triggerPlayerNumber = S2I(SubString(BlzGetTriggerSyncPrefix(), StringLength(SYNC_PREFIX), StringLength(BlzGetTriggerSyncPrefix())))
      local Faction triggerFaction = Persons[triggerPlayerNumber].faction
      set display = display + "\n|cffffcc00MAJOR EVENT - " + triggerFaction.prefixCol + title + "|r\n" + completionDesc + "\n"
      if GetLocalPlayer() != Player(triggerPlayerNumber) then
        call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, display)
        if Person(Persons[GetPlayerId(GetLocalPlayer())]).team.containsPlayer(triggerFaction.whichPerson.p) then
          call StartSound(bj_questCompletedSound)
        else
          call StartSound(bj_questWarningSound)
        endif
      endif
    endmethod

    private method displayFailed takes nothing returns nothing
      local integer i = 0
      local QuestItemData tempQuestItemData
      local string display = ""
      set display = display + "\n|cffffcc00QUEST FAILED - " + title + "|r\n"
      loop 
        exitwhen i == questItems.size
        set tempQuestItemData = questItems[i]
        if tempQuestItemData.Progress == QUEST_PROGRESS_COMPLETE then
          set display = display + " - |cff808080" + tempQuestItemData.desc + " (Completed)|r\n"
        elseif tempQuestItemData.Progress == QUEST_PROGRESS_FAILED then
          set display = display + " - |cffCD5C5C" + tempQuestItemData.desc + " (Failed)|r\n"
        else
          set display = display + " - " + tempQuestItemData.desc + "\n"
        endif
        set i = i + 1
      endloop
      call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, display)
      call StartSound(bj_questFailedSound)
    endmethod

    private method displayComplete takes nothing returns nothing
      local integer i = 0
      local QuestItemData tempQuestItemData
      local string display = ""
      set display = display + "\n|cffffcc00QUEST COMPLETED - " + title + "|r\n" + completionDesc + "\n"
      loop 
        exitwhen i == questItems.size
        set tempQuestItemData = questItems[i]
        set display = display + " - |cff808080" + tempQuestItemData.desc + " (Completed)|r\n"
        set i = i + 1
      endloop

      //Completed quest is global; pass this information to all clients so a synchronized message can be shared
      if Global then
        call BlzSendSyncData(SYNC_PREFIX + I2S(GetPlayerId(GetLocalPlayer())), I2S(this))
      endif

      call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, display)
      call StartSound(bj_questCompletedSound)
    endmethod

    public method displayDiscovered takes nothing returns nothing
      local integer i = 0
      local QuestItemData tempQuestItemData
      local string display = ""
      set display = display + "\n|cffffcc00QUEST DISCOVERED - " + title + "|r\n" + desc + "\n"
      loop 
        exitwhen i == questItems.size
        set tempQuestItemData = questItems[i]
        if tempQuestItemData.Progress == QUEST_PROGRESS_COMPLETE then
          set display = display + " - |cff808080" + tempQuestItemData.desc + " (Completed)|r\n"
        else
          set display = display + " - " + tempQuestItemData.desc + "\n"
        endif
        set i = i + 1
      endloop
      call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, display)
      call StartSound(bj_questDiscoveredSound)
    endmethod

    private method displayUpdate takes nothing returns nothing
      local integer i = 0
      local QuestItemData tempQuestItemData
      local string display = ""
      set display = display + "\n|cffffcc00QUEST UPDATED - " + title + "|r\n" + desc + "\n"
      loop 
        exitwhen i == questItems.size
        set tempQuestItemData = questItems[i]
        if tempQuestItemData.Progress == QUEST_PROGRESS_COMPLETE then
          set display = display + " - |cff808080" + tempQuestItemData.desc + " (Completed)|r\n"
        else
          set display = display + " - " + tempQuestItemData.desc + "\n"
        endif
        set i = i + 1
      endloop
      call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, display)
      call StartSound(bj_questUpdatedSound)
    endmethod

    private method setProgress takes integer whichState, boolean display returns nothing
      if whichState == QUEST_PROGRESS_UNDISCOVERED and whichState != progress then
        call QuestSetCompleted(quest, false)
        call QuestSetDiscovered(quest, false)
        call QuestSetFailed(quest, false)
      elseif whichState == QUEST_PROGRESS_INCOMPLETE then
        call QuestSetCompleted(quest, false)
        call QuestSetDiscovered(quest, true)
        call QuestSetFailed(quest, false)
        if display then 
          if progress == QUEST_PROGRESS_UNDISCOVERED then
            call displayDiscovered()
          else
            call displayUpdate()
          endif
        endif
      elseif whichState == QUEST_PROGRESS_COMPLETE and whichState != progress then
        call QuestSetCompleted(quest, true)
        call QuestSetDiscovered(quest, true)
        call QuestSetFailed(quest, false)
        if display then 
          call displayComplete()
        endif
      elseif whichState == QUEST_PROGRESS_FAILED and whichState != progress then
        call QuestSetCompleted(quest, false)
        call QuestSetDiscovered(quest, true)
        call QuestSetFailed(quest, true)
        if display then
          call displayFailed()
        endif
      endif
      set progress = whichState
    endmethod

    method operator Progress takes nothing returns integer
      return progress
    endmethod

    method operator Enabled= takes boolean b returns nothing
      call QuestSetEnabled(quest, b)
    endmethod

    //An item has changed completion; the Quest may need to change completion as well
    method onItemProgressChange takes QuestItemData whichItem, boolean display returns nothing
      local QuestItemData tempQuestItemData
      local integer i = 0
      local boolean allComplete = true
      local boolean anyFailed = false
      local boolean anyUndiscovered = false
      loop
        exitwhen i == questItems.size
        set tempQuestItemData = questItems[i]
        if tempQuestItemData.Progress != QUEST_PROGRESS_COMPLETE then
          set allComplete = false
          if tempQuestItemData.Progress == QUEST_PROGRESS_FAILED then
            set anyFailed = true
          elseif tempQuestItemData.Progress == QUEST_PROGRESS_UNDISCOVERED then
            set anyUndiscovered = true
          endif
        endif
        set i = i + 1
      endloop
      //If anything is undiscovered, the quest is undiscovered
      if anyUndiscovered == true and Progress != QUEST_PROGRESS_UNDISCOVERED then
        call setProgress(QUEST_PROGRESS_UNDISCOVERED, display)
      //If everything is complete, the quest is completed
      elseif allComplete == true and Progress != QUEST_PROGRESS_COMPLETE then
        call setProgress(QUEST_PROGRESS_COMPLETE, display)
      //If anything is failed, the quest is failed
      elseif anyFailed == true and Progress != QUEST_PROGRESS_FAILED then
        call setProgress(QUEST_PROGRESS_FAILED, display)
      else
        call setProgress(QUEST_PROGRESS_INCOMPLETE, display)
      endif
    endmethod

    method addItem takes string desc returns QuestItemData
      local QuestItemData tempItem = QuestItemData.create(this, desc)
      call questItems.add(tempItem)
      return tempItem
    endmethod

    static method create takes string title, string desc, string completionDesc, string icon returns thistype
      local thistype this = thistype.allocate()
      set this.quest = CreateQuest()
      set this.title = title
      set this.desc = desc
      set this.completionDesc = completionDesc
      set this.icon = icon
      set this.questItems = Set.create()
      set this.progress = QUEST_PROGRESS_INCOMPLETE
      call QuestSetTitle(quest, title)
      call QuestSetDescription(quest, desc)
      call QuestSetIconPath(quest, icon)
      call QuestSetRequired(quest, false)
      call QuestSetEnabled(quest, false)
      return this
    endmethod

    static method onSyncData takes nothing returns nothing
      if SubString(BlzGetTriggerSyncPrefix(), 0, StringLength(SYNC_PREFIX)) == SYNC_PREFIX then
        call QuestData(S2I(BlzGetTriggerSyncData())).displayGlobal()
      endif
    endmethod

    static method onInit takes nothing returns nothing
      local trigger trig = CreateTrigger()
      local integer i = 0
      loop
        exitwhen i == MAX_PLAYERS
        call TriggerRegisterPlayerEvent(trig, Player(i), EVENT_PLAYER_SYNC_DATA)
        set i = i + 1
      endloop
      call TriggerAddAction(trig, function thistype.onSyncData)
    endmethod
  endstruct

endlibrary QuestData