library QuestSafeSea requires QuestData, KultirasSetup

  globals 
    private constant integer QUEST_RESEARCH_ID = 'R06T'   //This research is given when the quest is completed
  endglobals

  struct QuestSafeSea extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "随着海上的威胁被肃清，你可以重组灰烬骑士团和召唤露希尔·维克雷斯。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "灰烬骑士团重生了，而露希尔·维克雷斯也可以被召唤了"
    endmethod

    private method OnComplete takes nothing returns nothing

    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("宣布海上已经安全", "海上的安全必须被保障，库尔提拉斯也必将回到它曾经的辉煌！", "ReplaceableTextures\\CommandButtons\\BTNKulTirasDreadnought.blp")
      call this.AddQuestItem(QuestItemTrain.create('hdes','hshy', 2))
      call this.AddQuestItem(QuestItemTrain.create('h04J','hshy', 1))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01W')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n07L')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n08Q')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09K')))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary