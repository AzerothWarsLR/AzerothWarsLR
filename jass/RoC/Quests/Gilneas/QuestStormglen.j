library QuestStormglen requires QuestData, GilneasSetup, QuestItemControlPoint, QuestItemExpire, QuestItemSelfExists, GeneralHelpers

  struct QuestStormglen extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "风谷村已经被解放"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得风谷村所有建筑"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock2, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock2, this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("风谷村", "下一个村庄就在黑瘴林旁边，风暴海崖的西南方。我们同时需要净化旁边森林。", "ReplaceableTextures\\CommandButtons\\BTNGilneasWizardTower.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n06V')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n084')))
      call this.AddQuestItem(QuestItemExpire.create(950))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary