library QuestItemData

  struct QuestItemData
    private QuestData parent
    private integer progress = QUEST_PROGRESS_INCOMPLETE
    private string description = ""
    private Event eventProgressChanged

    method operator EventProgressChanged takes nothing returns Event
      return this.eventProgressChanged
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

    stub method operator Progress takes nothing returns nothing
      return this.progress
    endmethod

    stub method operator Progress= takes integer value returns nothing
      if this.parent.ProgressLocked then
        return
      endif
      set this.progress = value
      call this.progressChanged.fire()
    endmethod

    stub method operator Description takes nothing returns string
      return this.description
    endmethod

    private method destroy takes nothing returns nothing

    endmethod

    static method create takes nothing returns thistype
      local thistype this = thistype.create()
      set this.eventProgressChanged = Event.create()
      return this
    endmethod
  endstruct

endlibrary