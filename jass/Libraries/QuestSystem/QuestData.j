library QuestData

  globals
    constant integer QUEST_PROGRESS_UNDISCOVERED = 0
    constant integer QUEST_PROGRESS_INCOMPLETE = 1
    constant integer QUEST_PROGRESS_COMPLETE = 2
    constant integer QUEST_PROGRESS_FAILED = 3
  endglobals

  struct QuestData
    private string title = "DEFAULTTITLE"
    private string description = "DEFAULTDESC"
    private integer progress = QUEST_PROGRESS_INCOMPLETE
    private Faction holder
    private quest quest

    private QuestItemData array questItems[10]
    private integer questItemCount = 0

    stub method operator Title takes nothing returns string
      return this.title
    endmethod

    stub method operator Global takes nothing returns boolean
      return false
    endmethod

    //Describes to the player what will happen when the quest is completed
    stub method operator CompletionDescription takes nothing returns string
      return null
    endmethod

    //Describes to the player what will happen when the quest is failed
    stub method operator FailureDescription takes nothing returns string
      return null
    endmethod

    //Displayed to the player when the quest is completed
    stub method operator CompletionPopup takes nothing returns string
      return null
    endmethod

    //Displayed to the player when the quest is failed
    stub method operator FailurePopup takes nothing returns string
      return null
    endmethod

    //Describes the background and flavour of this quest
    stub method operator Description takes nothing returns string
      return this.description
    endmethod

    method operator Quest takes nothing returns quest
      return this.quest
    endmethod

    method operator ProgressLocked takes nothing returns boolean
      return this.progress == QUEST_PROGRESS_COMPLETE or this.progress == QUEST_PROGRESS_FAILED
    endmethod

    method operator Progress takes nothing returns integer
      return this.progress
    endmethod

    stub method operator Progress= takes integer value returns nothing
      set this.progress = value
      if value == QUEST_PROGRESS_COMPLETE then
        call OnComplete()
      elseif value == QUEST_PROGRESS_FAILED then
        call OnFailed()
      endif
    endmethod

    //The faction that can complete this quest
    method operator Holder takes nothing returns Faction
      return this.holder
    endmethod

    method operator Holder= takes Faction value returns nothing
      if this.holder != 0 then
        call BJDebugMsg("Attempted to set Holder of quest " + this.title + " to " + value.name + " but it is already set to " + this.holder.name)
        return
      endif
      set this.holder = value
      call QuestSetDescription(this.quest, this.description + "\n|cffffcc00Reward:|r " + this.CompletionDescription)
    endmethod

    stub method OnComplete takes nothing returns nothing

    endmethod

    stub method OnFailed takes nothing returns nothing

    endmethod

    method Show takes nothing returns nothing
      local integer i = 0
      call QuestSetEnabled(this.quest, true)
      loop
        exitwhen i == this.questItemCount
        call questItems[i].Show()
        set i = i + 1
      endloop
    endmethod

    method Hide takes nothing returns nothing
      local integer i = 0
      call QuestSetEnabled(this.quest, false)
      loop
        exitwhen i == this.questItemCount
        call questItems[i].Hide()
        set i = i + 1
      endloop
    endmethod

    //Pops up to tell the holder about this quest (that they should be reading for the first time)
    method DisplayDiscovered takes nothing returns nothing

    endmethod

    private method OnQuestItemProgressChanged takes nothing returns nothing

    endmethod

    method AddQuestItem takes QuestItemData value returns QuestItemData
      local trigger trig = CreateTrigger()
      set this.questItems[this.questItemCount] = value
      set this.questItemCount = this.questItemCount + 1
      set value.QuestItem = QuestCreateItem(this.quest)
      set value.Parent = this
      call QuestItemSetDescription(value.QuestItem, value.Description)
      call value.ProgressChanged.register(trig)
      call TriggerAddAction(trig, function thistype.OnAnyQuestItemProgressChanged)
      return value
    endmethod

    private static method OnAnyQuestItemProgressChanged takes nothing returns nothing
    
    endmethod

    private method destroy takes nothing returns nothing

    endmethod

    static method create takes string title, string desc, string icon returns thistype
      local thistype this = thistype.allocate()
      set this.quest = CreateQuest()
      set this.description = desc
      call QuestSetTitle(this.quest, title)
      call QuestSetIconPath(this.quest, icon)
      call QuestSetRequired(this.quest, false)
      call QuestSetEnabled(this.quest, false)
      return this
    endmethod
  endstruct

endlibrary