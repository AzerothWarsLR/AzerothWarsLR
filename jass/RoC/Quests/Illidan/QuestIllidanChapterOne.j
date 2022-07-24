//Illidan Goes to Aetheneum, Finds Immoltar and kills him
library QuestIllidanChapterOne requires QuestData, QuestItemLegendReachRect, QuestItemLegendDead, LegendNaga

  struct QuestIllidanChapterOne extends QuestData

    private QuestData questToDiscover

    private method operator CompletionPopup takes nothing returns string
      return "伊利丹已经知道古尔丹之颅就藏在达拉然之中"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "第二章 - 古尔丹之颅"
    endmethod

    private method OnComplete takes nothing returns nothing
    set questToDiscover.Progress = QUEST_PROGRESS_INCOMPLETE
    endmethod

    public static method create takes QuestData questToDiscover returns thistype
      local thistype this = thistype.allocate("第一章：图书馆的秘密", "为了获得他渴望的力量，伊利丹必须搜刮隐秘的大图书馆内的秘密", "ReplaceableTextures\\CommandButtons\\BTNDoomlord.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_Dire_Maul_Entrance, "菲拉斯"))
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_AethneumLibraryEntrance, "大图书馆"))
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_ImmolFight, "伊莫塔尔的巢穴"))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_IMMOLTHAR))
      set this.questToDiscover = questToDiscover
      return this
    endmethod
  endstruct

endlibrary