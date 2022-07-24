library QuestLegionKillLordaeron requires LegionSetup, LegendLordaeron, LegendLegion, Display

  struct QuestLegionKillLordaeron extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "洛丹伦王国已经沦陷，对抗燃烧军团的先锋已经被消灭。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "提克迪奥斯获得15点力量、敏捷和智力"
    endmethod

    private method OnComplete takes nothing returns nothing
      call DisplayHeroReward(LEGEND_TICHONDRIUS.Unit, 15, 15, 15, 0)
      call AddHeroAttributes(LEGEND_TICHONDRIUS.Unit, 15, 15, 15)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("象征性的抵抗", "洛丹伦王国必须被消灭来为军团的到来铺平道路。", "ReplaceableTextures\\CommandButtons\\BTNTichondrius.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_CAPITALPALACE))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_STRATHOLME))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TYRSHAND))
      return this
    endmethod
  endstruct

endlibrary