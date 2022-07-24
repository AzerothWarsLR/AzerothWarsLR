library QuestDuskhaven requires QuestData, GilneasSetup, QuestItemControlPoint, QuestItemExpire, QuestItemSelfExists, GeneralHelpers

  struct QuestDuskhaven extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "暮湾镇已经被解放"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得暮湾镇所有建筑"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock4, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock4, this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("暮湾镇", "下一座城镇在西部海岸。", "ReplaceableTextures\\CommandButtons\\BTNGilneasTownHall.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n031')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n06V')))
      call this.AddQuestItem(QuestItemExpire.create(1280))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary