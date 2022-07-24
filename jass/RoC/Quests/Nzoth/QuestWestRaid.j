library QuestWestRaid requires QuestData, NzothSetup

  struct QuestWestRaid extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "我们现在控制艾萨拉海岸并从废墟中发现了一些丢失的宝藏。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得200黄金和3500木材"
    endmethod

    private method OnComplete takes nothing returns nothing
      call AdjustPlayerStateBJ(3500, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER)
      call AdjustPlayerStateBJ( 200, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("艾萨拉海岸", "在艾萨拉海岸的废墟中有许多被遗忘的财富，如果我们能控制这个地区，我们就可以获得那些宝藏。", "ReplaceableTextures\\CommandButtons\\BTNShrineOfAszhara.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01S')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09R')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BM')))
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_NAZJAR, gg_rct_Broken_Isles, "破碎群岛"))
      return this
    endmethod
  endstruct

endlibrary