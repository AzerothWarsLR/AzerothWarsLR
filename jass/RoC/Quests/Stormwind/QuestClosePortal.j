library QuestClosePortal requires QuestData, QuestItemChannelRect

  struct QuestClosePortal extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "卡德加已经完全地关闭了黑暗之门"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "将黑暗之门完全关闭"
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
      local thistype this = thistype.allocate("封住黑暗之门", "黑暗之门数十年来都是暴风王国的威胁，现在是时候彻底结束这个威胁了", "ReplaceableTextures\\CommandButtons\\BTNDarkPortal.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_ClosePortal, "黑暗之门", LEGEND_KHADGAR, 480, 270))
      return this
    endmethod
  endstruct

endlibrary