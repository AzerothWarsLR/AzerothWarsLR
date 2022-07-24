library QuestKeelHarbor requires QuestData, GilneasSetup, QuestItemControlPoint, QuestItemExpire, QuestItemSelfExists, GeneralHelpers

  struct QuestKeelHarbor extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Keel Harbor has been liberated."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all buildings in Keel Harbor "
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock3, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock3, this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Keel Harbor", "The final village is the coastal harbor near the capital", "ReplaceableTextures\\CommandButtons\\BTNGilneasShipyard.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n08X')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n031')))
      call this.AddQuestItem(QuestItemExpire.create(1280))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary