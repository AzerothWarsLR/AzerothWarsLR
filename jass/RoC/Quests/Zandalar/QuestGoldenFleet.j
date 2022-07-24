library QuestGoldenFleet requires QuestData

  globals
    private constant integer QUEST_RESEARCH_ID = 'R06W'   //This research is given when the quest is completed
  endglobals

  struct QuestGoldenFleet extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "现在可以召唤拉斯塔哈，并允许训练恐角龙单位"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "允许在祭坛内召唤拉斯塔哈，并允许训练恐角龙单位"
    endmethod

    private method OnComplete takes nothing returns nothing
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("黄金舰队", "国王下令建造世界上最大的无敌舰队，黄金舰队的建造已经开始", "ReplaceableTextures\\CommandButtons\\BTNTrollConjurer.blp")
      call this.AddQuestItem(QuestItemTrain.create('o04W','o049', 5))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary