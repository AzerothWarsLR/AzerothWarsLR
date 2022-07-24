library QuestYoggSaron requires QuestData, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R07R'
  endglobals

  struct QuestYoggSaron extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "尤格-萨隆已经苏醒"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "古神尤格-萨隆将加入黑暗帝国，并可以训练遗忘者单位。"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitRescue(gg_unit_U02C_2829, this.Holder.Player)  //Yogg
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("千面之魔", "尤格-萨隆在无数年前被泰坦们囚禁在诺森德之下。", "ReplaceableTextures\\CommandButtons\\BTNYogg-saronIcon.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n053')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00I')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n02S')))
      set this.ResearchId = RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary