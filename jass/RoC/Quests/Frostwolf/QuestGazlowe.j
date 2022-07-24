library QuestGazlowe requires QuestData, ControlPoint, FrostwolfSetup, LegendFrostwolf

  globals
    private constant integer RESEARCH_ID = 'R01F'
    private constant integer HERO_ID = 'Ntin'
  endglobals

  struct QuestGazlowe extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "现在地精的家园，科赞在" + this.Holder.Name + "的控制之下, 地精工程师加兹鲁维将为你提供他的服务，为你的伐木机升级新的装备。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "你可以可以从祭坛内召唤加兹鲁维，伐木机将学会口袋工厂、锯子炸弹和紧急维修。"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(HERO_ID, 1)
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("爆炸工程", "部落想要发展就需要工程技术。科赞的地精们正好可以提供这样的专业知识。", "ReplaceableTextures\\CommandButtons\\BTNHeroTinker.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n04Z')))
      return this
    endmethod
  endstruct

endlibrary