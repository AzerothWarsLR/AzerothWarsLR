library QuestRetakeSunwell requires QuestData, ForsakenSetup, LegendForsaken, LegendQuelthalas

  struct QuestRetakeSunwell extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "希尔瓦娜斯和在女妖大厅内的单位获得500额外生命值"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "希尔瓦娜斯和她的女妖们将会获得额外500点生命值"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, 'R07V', 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("夺回太阳井", "即便已经成为了被遗忘者女妖，太阳井仍在召唤她们。夺回太阳井来增强女妖们的生命力。", "ReplaceableTextures\\CommandButtons\\BTNGhost.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_SUNWELL, false))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_UNDERCITY, false))
      return this
    endmethod
  endstruct

endlibrary