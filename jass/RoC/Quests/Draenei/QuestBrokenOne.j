library QuestBrokenOne requires QuestData, DraeneiSetup

  globals
    private constant integer QUESTRESEARCH_ID = 'R083'   //This research is given when the quest is completed
  endglobals
  
  struct QuestBrokenOne extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "祭坛内可以召唤努波顿了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "努波顿将会加入埃索达的幸存者"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("破碎者", "大萨满努波顿为了让维纶带领其他德莱尼逃跑而留下来战斗。如果德莱尼能够坚持的够久，也许他能够回来加入埃索达的幸存者们。", "ReplaceableTextures\\CommandButtons\\BTNAkamanew.blp")
      call this.AddQuestItem(QuestItemTime.create(660))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n02O')))
      set this.ResearchId = QUESTRESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary