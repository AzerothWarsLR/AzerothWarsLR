library QuestEmbassy requires QuestData, LegionSetup

  globals
    private constant integer HERO_ID = 'U00L'
    private constant integer ALTAR_ID = 'u01N'
  endglobals

  struct QuestEmbassy extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "我们已经将外域中的德莱尼人消灭了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "允许建造炼狱机器工厂和在" + GetObjectName(ALTAR_ID) + "内召唤安纳塞隆"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("种族灭绝德莱尼", "德莱尼的存在侮辱了燃烧军团的艾瑞达领主，杀光他们。", "ReplaceableTextures\\CommandButtons\\BTNEredarRed.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_EXODARSHIP))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TELREDOR))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FARAHLON))
      set this.ResearchId = 'R042'
      return this
    endmethod
  endstruct

endlibrary