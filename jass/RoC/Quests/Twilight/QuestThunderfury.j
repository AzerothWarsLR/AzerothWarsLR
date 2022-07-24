library QuestThunderfury requires QuestData, Artifact, LegendTwilight, GeneralHelpers

  struct QuestThunderfury extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "古加尔找到了传说之剑雷霆之怒"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "传说之剑雷霆之怒"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddItemSafe(LEGEND_CHOGALL.Unit, ARTIFACT_THUNDERFURY.item) 
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("逐风者的祝福之剑", "传说之剑，雷霆之怒，遗失在了破碎群岛的某处，而古加尔在预言中看到了它。它将成为古神的宝贵财富。", "ReplaceableTextures\\CommandButtons\\BTNThunderfury2.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_CHOGALL, gg_rct_Broken_Isles, "破碎群岛"))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n05Y')))
      return this
    endmethod
  endstruct

endlibrary