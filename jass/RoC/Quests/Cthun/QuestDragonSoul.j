library QuestDragonSoul requires QuestData, GeneralHelpers

  struct QuestDragonSoul extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "斯克拉姆将获得巨龙之魂"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "斯克拉姆将获得巨龙之魂"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddItemSafe(LEGEND_SKERAM.Unit, ARTIFACT_DEMONSOUL.item) 
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("巨龙之魂", "巨龙之魂很久之前就遗失在了黑石山内，斯克拉姆可能有足够的力量来恢复它。", "ReplaceableTextures\\CommandButtons\\BTNBrokenAmulet.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_DragonSoulChannel, "燃烧平原", LEGEND_SKERAM, 240, 160))
      return this
    endmethod
  endstruct

endlibrary