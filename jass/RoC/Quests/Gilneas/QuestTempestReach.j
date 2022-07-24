library QuestTempestReach requires QuestData, GilneasSetup, QuestItemControlPoint, QuestItemExpire, QuestItemSelfExists, GeneralHelpers

  struct QuestTempestReach extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Tempest Reach has been liberated."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all buildings in Tempest Reach"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock1, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock1, this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Tempest Reach", "The first settlement we need to capture is Tempest Reach, just south of our location", "ReplaceableTextures\\CommandButtons\\BTNGilneasFarm.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n084')))
      call this.AddQuestItem(QuestItemExpire.create(670))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary