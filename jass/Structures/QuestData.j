library QuestData requires Set

  globals
    constant integer QUEST_PROGRESS_UNDISCOVERED = 0
    constant integer QUEST_PROGRESS_INCOMPLETE = 1
    constant integer QUEST_PROGRESS_COMPLETE = 2
    constant integer QUEST_PROGRESS_FAILED = 3
  endglobals

  struct QuestItemData
    private questitem questItem
    readonly QuestData parent
    private integer progress
    readonly string desc

    method operator Progress takes nothing returns integer
      return progress
    endmethod

    method operator Progress= takes integer i returns nothing
      if progress != i then
        set progress = i
        if i == QUEST_PROGRESS_COMPLETE then
          call QuestItemSetCompleted(questItem, true)
        else
          call QuestItemSetCompleted(questItem, false)
        endif
        call parent.onItemProgressChange(this)
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

    private method displayFailed takes nothing returns nothing
      local integer i = 0
      local QuestItemData tempQuestItemData
      local string display = ""
      set display = display + "|cffffcc00QUEST FAILED - " + title + "|r\n" + desc + "\n"
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
      set display = display + "|cffffcc00QUEST COMPLETED - " + title + "|r\n" + completionDesc + "\n"
      loop 
        exitwhen i == questItems.size
        set tempQuestItemData = questItems[i]
        set display = display + " - |cff808080" + tempQuestItemData.desc + " (Completed)|r\n"
        set i = i + 1
      endloop
      call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, display)
      call StartSound(bj_questCompletedSound)
    endmethod

    private method displayUpdate takes nothing returns nothing
      local integer i = 0
      local QuestItemData tempQuestItemData
      local string display = ""
      set display = display + "|cffffcc00QUEST UPDATED - " + title + "|r\n" + desc + "\n"
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

    private method operator Progress= takes integer whichState returns nothing
      if whichState != progress then
        if whichState == QUEST_PROGRESS_UNDISCOVERED then
          call QuestSetCompleted(quest, false)
          call QuestSetDiscovered(quest, false)
          call QuestSetFailed(quest, false)
        elseif whichState == QUEST_PROGRESS_INCOMPLETE then
          call StartSound(bj_questDiscoveredSound)
          call QuestSetCompleted(quest, false)
          call QuestSetDiscovered(quest, true)
          call QuestSetFailed(quest, false)
        elseif whichState == QUEST_PROGRESS_COMPLETE then
          call QuestSetCompleted(quest, true)
          call QuestSetDiscovered(quest, true)
          call QuestSetFailed(quest, false)
          call displayComplete()
        elseif whichState == QUEST_PROGRESS_FAILED then
          call QuestSetCompleted(quest, false)
          call QuestSetDiscovered(quest, true)
          call QuestSetFailed(quest, true)
          call displayFailed()
        endif
      endif
      set progress = whichState
    endmethod

    method operator Enabled= takes boolean b returns nothing
      call QuestSetEnabled(quest, b)
    endmethod

    //An item has changed completion; the Quest may need to change completion as well
    method onItemProgressChange takes QuestItemData whichItem returns nothing
      local QuestItemData tempQuestItemData
      local integer i = 0
      local boolean allComplete = true
      local boolean anyFailed = false
      loop
        exitwhen i == questItems.size
        set tempQuestItemData = questItems[i]
        if tempQuestItemData.Progress != QUEST_PROGRESS_COMPLETE then
          set allComplete = false
          if tempQuestItemData.Progress == QUEST_PROGRESS_FAILED then
            set anyFailed = true
          endif
        endif
        set i = i + 1
      endloop
      if allComplete == true then
        set Progress = QUEST_PROGRESS_COMPLETE
      elseif anyFailed == true then
        set Progress = QUEST_PROGRESS_FAILED
      else
        set Progress = QUEST_PROGRESS_INCOMPLETE
        call displayUpdate()
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
      call QuestSetTitle(quest, title)
      call QuestSetDescription(quest, desc)
      call QuestSetIconPath(quest, icon)
      call QuestSetRequired(quest, false)
      call QuestSetEnabled(quest, false)
      return this
    endmethod
  endstruct

endlibrary QuestData