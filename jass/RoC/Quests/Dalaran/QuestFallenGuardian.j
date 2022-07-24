library QuestFallenGuardian requires LegendDalaran, LegendNeutral, ControlPoint

  globals
    private constant integer RESEARCH_ID = 'R04K'
    private constant integer MEDIVH_ID = 'Haah'
  endglobals

  struct QuestFallenGuardian extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "萨格拉斯的影响已经被从麦迪文的灵魂中被清除并允许他回到艾泽拉斯一段时间。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "你可以在知识圣坛内召唤麦迪文。"
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
      call Holder.ModObjectLimit(MEDIVH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("堕落的守护者", "麦迪文的肉体在其母亲受孕时被萨格拉斯腐化了。既然现在他已经死了，萨格拉斯之墓的秘密和萨格拉斯结合在一起也许能让达拉然的法师们净化他的灵魂。", "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_KARAZHAN, false))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00J')))
      set this.ResearchId = 'R04K'
      return this
    endmethod
  endstruct

endlibrary