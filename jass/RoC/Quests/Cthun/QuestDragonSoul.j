library QuestDragonSoul requires QuestData, GeneralHelpers

  struct QuestDragonSoul extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Skeram will be granted the Dragon Soul"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The Dragon Soul will be granted to Skeram"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddItemSafe(LEGEND_SKERAM.Unit, ARTIFACT_DEMONSOUL.item) 
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Dragon Soul", "The Dragon Soul was lost in the Blackrock Mountain long ago. Skeram might be powerful enough to restore it.", "ReplaceableTextures\\CommandButtons\\BTNBrokenAmulet.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_DragonSoulChannel, "Burning Steppe", LEGEND_SKERAM, 240, 160))
      return this
    endmethod
  endstruct

endlibrary