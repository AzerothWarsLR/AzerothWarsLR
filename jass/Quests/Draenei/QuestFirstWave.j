library QuestFirstWave requires QuestData, DraeneiSetup

  struct QuestFirstWave extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "The Draenei have holded long enough and most of their civilisation had time to join the Exodar"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The Divine Citadel, Astral Sanctum and Crystal Spire will not be deleted from Azuremyst. You will not lose the bonus gold from the gold you mined in Outland."
    endmethod

    private method OnFail takes nothing returns nothing
      call KillUnit(gg_unit_o051_3356)
      call KillUnit(gg_unit_o055_3337)
      call KillUnit(gg_unit_o054_3338)
      call AdjustPlayerStateBJ( -( 2000 - GetResourceAmount(gg_unit_ngol_3272) ), Player(13), PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Broken Civilisation", "The Fel Orc attack will begin at any moment, the Draenei need to evacuate their civilians aboard the Exodar", "ReplaceableTextures\\CommandButtons\\BTNDraeneiDivineCitadel.blp")
      call this.AddQuestItem(QuestItemTime.create(540))
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_EXODARSHIP))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary