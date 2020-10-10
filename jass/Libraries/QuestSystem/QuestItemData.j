library QuestItemData

  struct QuestItemData
    private QuestData parent
    private integer progress = QUEST_PROGRESS_INCOMPLETE
    private string description = ""
    private Event progressChanged
    private questitem questItem
    private static thistype triggerQuestItemData = 0
    private minimapicon minimapIcon = null

    static method TriggerQuestItemData takes nothing returns thistype
      return thistype.triggerQuestItemData
    endmethod

    method operator Parent= takes QuestData value returns nothing
      set this.parent = value
    endmethod

    method operator QuestItem takes nothing returns questitem
      return this.questItem
    endmethod

    method operator QuestItem= takes questitem value returns nothing
      set this.questItem = value
    endmethod

    method operator ProgressChanged takes nothing returns Event
      return this.progressChanged
    endmethod

    stub method operator X takes nothing returns real
      return 0.
    endmethod

    stub method operator Y takes nothing returns real
      return 0.
    endmethod

    method operator Holder takes nothing returns Faction
      return this.parent.Holder
    endmethod

    stub method operator Progress takes nothing returns integer
      return this.progress
    endmethod

    stub method operator Progress= takes integer value returns nothing
      if this.parent.ProgressLocked then
        return
      endif
      set this.progress = value
      if value == QUEST_PROGRESS_INCOMPLETE then
        call QuestItemSetCompleted(this.questItem, false)
      elseif value == QUEST_PROGRESS_COMPLETE then
        call QuestItemSetCompleted(this.questItem, true)
      elseif value == QUEST_PROGRESS_UNDISCOVERED then
        call QuestItemSetCompleted(this.questItem, false)
      elseif value == QUEST_PROGRESS_FAILED then
        call QuestItemSetCompleted(this.questItem, false)
      endif
      call this.progressChanged.fire()
    endmethod

    stub method operator Description takes nothing returns string
      return this.description
    endmethod

    stub method operator Description= takes string value returns nothing
      set this.description = value
    endmethod

    method Show takes nothing returns nothing
      local integer i = 0
      if this.minimapIcon == null and this.X != 0 and this.Y != 0 then
        set this.minimapIcon = CreateMinimapIcon(this.X, this.Y, 255, 255, 255, SkinManagerGetLocalPath("MinimapQuestObjectivePrimary"), FOG_OF_WAR_MASKED)
      elseif this.minimapIcon != null then
        call SetMinimapIconVisible(this.minimapIcon, true)
      endif
    endmethod

    method Hide takes nothing returns nothing
      local integer i = 0
      if this.minimapIcon != null then
        call SetMinimapIconVisible(this.minimapIcon, false)
      endif
    endmethod

    private method destroy takes nothing returns nothing

    endmethod

    static method create takes nothing returns thistype
      local thistype this = thistype.allocate()
      set this.progressChanged = Event.create()
      return this
    endmethod
  endstruct

endlibrary