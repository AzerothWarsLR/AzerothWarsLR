library QuestGoblinEmpire requires QuestData, KultirasSetup

  globals 
    private constant integer QUEST_RESEARCH_ID = 'R07F'   //This research is given when the quest is completed
  endglobals

  struct QuestGoblinEmpire extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "随着所有地精城镇的联合，一个新的帝国崛起了！"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "解锁洲际火炮"
    endmethod

    private method OnComplete takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("地精帝国", "所有的地精集团都必须统一在一个旗帜之下", "ReplaceableTextures\\CommandButtons\\BTNGoblinWarZeppelin.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01X')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00L')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n07Y')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01E')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n04Z')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n05C')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0A6')))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary