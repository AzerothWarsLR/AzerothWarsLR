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

    stub method operator Progress= takes integer value returns nothing
      set this.progress = value
      if value == QUEST_PROGRESS_COMPLETE then
        call OnComplete()
      elseif value == QUEST_PROGRESS_FAILED
        call OnFailed()
      endif
    endmethod

    //The faction that can complete this quest
    method operator Holder takes nothing returns Faction
      return this.holder
    endmethod

    stub method OnComplete takes nothing returns nothing

    endmethod

    stub method OnFailed takes nothing returns nothing

    endmethod

    private method destroy takes nothing returns nothing

    endmethod

    static method create takes string title, string desc, string icon returns thistype
      local thistype this = thistype.create()
      return this
    endmethod
  endstruct

endlibrary