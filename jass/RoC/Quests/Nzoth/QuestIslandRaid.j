library QuestIslandRaid requires QuestData, NzothSetup

  struct QuestIslandRaid extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "现在我们控制了这些岛屿并掠夺了上面的资源"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得200黄金和3500木材，你的食物限制变为40"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerStateBJ( this.Holder.Player, PLAYER_STATE_FOOD_CAP_CEILING, 50 )
      call AdjustPlayerStateBJ(3500, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER)
      call AdjustPlayerStateBJ( 200, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("掠夺岛屿", "大海拒绝了岛屿上的许多宝藏。控制这些岛屿来发现隐藏的资源", "ReplaceableTextures\\CommandButtons\\BTNChestOfGold.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n05Y')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09C')))
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_NAZJAR, gg_rct_Broken_Isles, "破碎群岛"))
      return this
    endmethod
  endstruct

endlibrary