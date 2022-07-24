library QuestSpreadTheWord requires QuestData

  globals
    private constant integer QUEST_RESEARCH_ID = 'R05F'   //This research is given when the quest is completed
  endglobals

  struct QuestSpreadTheWord extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "可以召唤高阶女祭司艾苏尔了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "祭坛内可以召唤高阶女祭司艾苏尔了"
    endmethod

    private method OnComplete takes nothing returns nothing
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("传播古神的低语", "世界将聆听古神的低语。传播末日的景象。", "ReplaceableTextures\\CommandButtons\\BTNOldGodWhispers.blp")
      call this.AddQuestItem(QuestItemBuild.create('o03C', 1))
      call this.AddQuestItem(QuestItemTrain.create('obot','o03I', 3))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary