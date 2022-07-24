library QuestSurvivorsShattrah requires QuestData, DraeneiSetup

  globals
    private constant integer QUESTRESEARCH_ID = 'R082'   //This research is given when the quest is completed
  endglobals
  
  struct QuestSurvivorsShattrah extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "祭坛内可以召唤玛尔拉德"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "玛尔拉德将加入埃索达的幸存者"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("沙塔斯的幸存者", "沙塔斯大屠杀即迅速又残酷，如果德莱尼人在外域坚持足够长的时间，他们也许能重新找回一些幸存者。", "ReplaceableTextures\\CommandButtons\\BTNGlazeroth.blp")
      call this.AddQuestItem(QuestItemTime.create(420))
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_EXODARSHIP))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUESTRESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary