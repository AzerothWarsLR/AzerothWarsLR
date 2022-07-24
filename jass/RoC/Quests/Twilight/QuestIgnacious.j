library QuestIgnacious requires QuestData, TwilightSetup, QuestItemLegendDead, LegendIronforge

  globals
    private constant integer RESEARCH_ID = 'R07Q'
  endglobals

  struct QuestIgnacious extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "伟大的拉格纳罗斯让我们的一位萨满晋升了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "你可以在祭坛中召唤伊格纳修斯了"
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("炎魔之王的恩赐", "摧毁矮人大熔炉将取悦伟大的火元素领主拉格纳罗斯。", "ReplaceableTextures\\CommandButtons\\BTNHeroAvatarOfFlame.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_GREATFORGE))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0AA')))
      set this.ResearchId = RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary