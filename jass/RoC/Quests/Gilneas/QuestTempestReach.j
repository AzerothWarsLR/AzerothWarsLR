library QuestTempestReach requires QuestData, GilneasSetup, QuestItemControlPoint, QuestItemExpire, QuestItemSelfExists, GeneralHelpers

  struct QuestTempestReach extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "风暴海崖已经被解放"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得风暴海崖所有建筑"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock1, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock1, this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("风暴海崖", "我们需要占领的第一个定居点是风暴海崖，就在我们所在的南方。", "ReplaceableTextures\\CommandButtons\\BTNGilneasFarm.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n084')))
      call this.AddQuestItem(QuestItemExpire.create(670))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary