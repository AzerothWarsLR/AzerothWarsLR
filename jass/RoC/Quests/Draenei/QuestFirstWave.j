library QuestFirstWave requires QuestData, DraeneiSetup

  struct QuestFirstWave extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "The Draenei have holded long enough and most of their civilisation had time to join the Exodar"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The Divine Citadel, Shipyard, Ships, Astral Sanctum and Crystal Spire will not be deleted from Azuremyst"
    endmethod

    private method OnFail takes nothing returns nothing
      call KillUnit(gg_unit_o051_3356)
      call KillUnit(gg_unit_o059_3317)
      call KillUnit(gg_unit_o055_3337)
      call KillUnit(gg_unit_o054_3338)
      call KillUnit(gg_unit_edes_3396)
      call KillUnit(gg_unit_etrs_3383)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Broken Civilisation", "The Fel Orc attack will begin at any moment, the Draenei need to evacuate their civilians aboard the Exodar", "ReplaceableTextures\\CommandButtons\\BTNDraeneiDivineCitadel.blp")
      call this.AddQuestItem(QuestItemTime.create(720))
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_EXODARSHIP))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary