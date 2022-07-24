library QuestGoldrinnHumanPath requires QuestData, GilneasSetup

  globals
    private constant integer QUEST_RESEARCH_ID = 'R07U'   //This research is given when the quest is completed
  endglobals

  struct QuestGoldrinnHumanPath extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "戈德林加入了吉尔尼斯，而吉尔尼斯加入了联盟"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "可以在祭坛内召唤戈德林"
    endmethod

    private method OnComplete takes nothing returns nothing
      set GOLDRINNELVE_PATH.Progress = QUEST_PROGRESS_FAILED
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("暮色森林", "为了了解她人民所处的困境，苔丝将前往暮色森林的戈德林神殿去了解什么是狼人", "ReplaceableTextures\\CommandButtons\\BTNWorgenHunger.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_TESS, gg_rct_GoldrinnDuskwood, "暮色森林内的戈德林神殿"))
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_GENN))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary