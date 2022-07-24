library QuestAstranaar requires QuestData, SentinelsSetup, GeneralHelpers

  struct QuestAstranaar extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "阿斯特兰纳已经被解放，并加入了哨兵"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得阿斯特兰纳前哨和达纳苏斯的所有单位和建筑"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_AstranaarUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call RescueNeutralUnitsInRect(gg_rct_TeldrassilUnlock1, Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call RescueNeutralUnitsInRect(gg_rct_TeldrassilUnlock2, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_AstranaarUnlock, this.Holder.Player)
      call RescueNeutralUnitsInRect(gg_rct_TeldrassilUnlock1, this.Holder.Player)
      call RescueNeutralUnitsInRect(gg_rct_TeldrassilUnlock2, this.Holder.Player)
      call AdjustPlayerStateBJ( 200, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
      call AdjustPlayerStateBJ( 100, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("阿斯特兰纳要塞", "黑海岸正遭受一些鱼人的袭击。我们应该迅速对付他们，然后前往阿斯特拉纳前哨。清除鱼人也将让我们能够重新与达纳苏斯建立联系。", "ReplaceableTextures\\CommandButtons\\BTNMurloc.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_TYRANDE, gg_rct_AstranaarUnlock, "阿斯特拉纳前哨"))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n02U')))
      call this.AddQuestItem(QuestItemExpire.create(1430))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary