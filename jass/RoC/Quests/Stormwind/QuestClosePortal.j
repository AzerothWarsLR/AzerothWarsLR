library QuestClosePortal requires QuestData, QuestItemChannelRect

  struct QuestClosePortal extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "Khadgar has closed the Dark Portal definately"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Close the Dark Portal from both sides"
    endmethod

    private method OnComplete takes nothing returns nothing
      call RemoveUnit(gg_unit_n036_2719)
      call RemoveUnit(gg_unit_n036_2720)
      call RemoveUnit(gg_unit_n036_1065)

      call RemoveUnit(gg_unit_n036_0778)
      call RemoveUnit(gg_unit_n036_3291)
      call RemoveUnit(gg_unit_n036_3292)

      call RemoveUnit(gg_unit_n05J_3375)
      call RemoveUnit(gg_unit_n05J_3370)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Seal the Dark Portal", "The Dark Portal has been a menace to the Kingdom of Stormwind for decades, it is time to end the menace once and for all.", "ReplaceableTextures\\CommandButtons\\BTNDarkPortal.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_ClosePortal, "The Dark Portal", LEGEND_KHADGAR, 480, 270))
      return this
    endmethod
  endstruct

endlibrary