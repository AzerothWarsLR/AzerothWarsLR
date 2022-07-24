library QuestGoldrinnElvePath requires QuestData, GilneasSetup

  globals
    private constant integer QUEST_RESEARCH_ID = 'R07U'   //This research is given when the quest is completed
  endglobals

  struct QuestGoldrinnElvePath extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "戈德林加入了吉尔尼斯"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "可以在祭坛内召唤戈德林"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("狼神神殿", "为了了解她人民的困境，苔丝将前往暗夜精灵那了解什么是狼人。她需要到达在海加尔山的戈德林神殿", "ReplaceableTextures\\CommandButtons\\BTNWorgenMoon.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_TESS, gg_rct_GoldrinnHyjal, "海加尔山的戈德林神殿"))
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_GENN))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary