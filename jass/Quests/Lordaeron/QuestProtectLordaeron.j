//When Capital Palace, Stratholme and Tyr's Hand Citadel all die, Arthas is removed.
library QuestProtectLordaeron requires QuestData, LordaeronConfig, QuestKingArthas, QuestCorruptArthas

  struct QuestProtectLordaeron extends QuestData
    private method FailurePopup takes nothing returns string
      return ""
    endmethod

    private method OnFail takes nothing returns nothing
      if LEGEND_ARTHAS.OwningFaction == this.Holder then
        call KillUnit(LEGEND_ARTHAS.Unit)
        call LEGEND_ARTHAS.Unit == null
      endif
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Bastion of Humanity", "The Kingdom of Lordaeron faces threats from all sides. If all of its capitals fall, Prince Arthas will abandon his people on a mission of revenge.", "ReplaceableTextures\\CommandButtons\\BTNCastle.blp")
      call this.AddQuestItem(QuestItemLegendAlive.create(LEGEND_CAPITALPALACE))
      call this.AddQuestItem(QuestItemLegendAlive.create(LEGEND_STRATHOLME))
      call this.AddQuestItem(QuestItemLegendAlive.create(LEGEND_TYRSHAND))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_LORDAERON.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary