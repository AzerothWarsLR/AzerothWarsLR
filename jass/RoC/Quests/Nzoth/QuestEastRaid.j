library QuestEastRaid requires QuestData, NzothSetup

  struct QuestEastRaid extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "现在我们控制了联盟南部海岸并袭击了它们的土地以获得资源"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得200黄金和3000木材"
    endmethod

    private method OnComplete takes nothing returns nothing
      call AdjustPlayerStateBJ(3500, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER)
      call AdjustPlayerStateBJ( 200, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("海上掠夺者", "联盟南部海岸资源丰富，非常容易成为我们掠夺的目标", "ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidon.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n084')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n06W')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n08M')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n08Q')))
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_NAZJAR, gg_rct_Broken_Isles, "破碎群岛"))
      return this
    endmethod
  endstruct

endlibrary