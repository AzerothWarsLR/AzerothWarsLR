library QuestTriumvirate requires DraeneiSetup, QuestItemControlPoint, GeneralHelpers

  struct QuestTriumvirate extends QuestData
    private method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "维纶解放了阿古斯，重新组装了执政团之冠"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "你获得了执政团之冠"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddItemSafe(LEGEND_VELEN.Unit, ARTIFACT_CROWNTRIUMVIRATE.item)
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("执政团之冠", "很久以前，领导着德莱尼人的是执政团。如果维纶能重新征服阿古斯，他便可以重组执政官之冠。", "ReplaceableTextures\\CommandButtons\\BTNNeverMeltingCrown.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BH')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BL')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09X')))
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_VELEN))
      return this
    endmethod
  endstruct

endlibrary