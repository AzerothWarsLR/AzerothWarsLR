library QuestStormglen requires QuestData, GilneasSetup, QuestItemControlPoint, QuestItemExpire, QuestItemSelfExists, GeneralHelpers

  struct QuestStormglen extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Stormglen Village has been liberated."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all buildings in Stormglen Village"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock2, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock2, this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Stormglen", "The next village is right next to the Blackwald, south west of Tempest Reach. We will need to purify the forest too", "ReplaceableTextures\\CommandButtons\\BTNGilneasWizardTower.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n06V')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n084')))
      call this.AddQuestItem(QuestItemExpire.create(950))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary