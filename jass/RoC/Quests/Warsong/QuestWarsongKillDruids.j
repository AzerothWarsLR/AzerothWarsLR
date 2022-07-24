library QuestWarsongKillDruids requires WarsongSetup, LegendDruids, Display

  globals
    private constant integer QUEST_RESEARCH_ID = 'R08M'   //This research is given when the quest is completed
  endglobals

  struct QuestWarsongKillDruids extends QuestData
    private static integer EXPERIENCE_REWARD = 10000

    private method operator CompletionPopup takes nothing returns string
      return "世界之树已经被占领。战歌至上！"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "格罗姆·地狱咆哮获得 " + I2S(EXPERIENCE_REWARD) + " 点经验并允许召唤工头格里布斯"
    endmethod

    private method OnComplete takes nothing returns nothing
      call AddHeroXP(LEGEND_GROM.Unit, EXPERIENCE_REWARD, true)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("拆掉它", "世界之树是暗夜精灵永生的源头。占领它来永久的削弱暗夜精灵。","ReplaceableTextures\\CommandButtons\\BTNFountainOfLife.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_NORDRASSIL, false))
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_GROM))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary