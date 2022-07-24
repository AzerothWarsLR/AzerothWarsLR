library QuestExplosiveEngineering requires QuestData

  globals
    private constant integer QUEST_RESEARCH_ID = 'R01F'   //This research is given when the quest is completed
  endglobals

  struct QuestExplosiveEngineering extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "解锁加兹鲁维"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "祭坛内可以召唤加兹鲁维了"
    endmethod

    private method OnComplete takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("爆炸工程学", "地精总工程师加兹鲁维正在监督海上石油平台的建设。", "ReplaceableTextures\\CommandButtons\\BTNHeroTinker.blp")
      call this.AddQuestItem(QuestItemTrain.create('n0AQ','h04Z', 4))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary