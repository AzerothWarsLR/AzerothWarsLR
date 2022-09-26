library QuestDuskhaven requires QuestData, GilneasSetup, QuestItemControlPoint, QuestItemExpire, QuestItemSelfExists, GeneralHelpers

  struct QuestDuskhaven extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Duskhaven has been liberated."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all buildings in Duskhaven "
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock4, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock4, this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Duskhaven", "The next town is located in the western coast", "ReplaceableTextures\\CommandButtons\\BTNGilneasTownHall.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n031')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n06V')))
      call this.AddQuestItem(QuestItemExpire.create(1280))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary