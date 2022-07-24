library QuestChaseDraenei requires QuestData

  struct QuestChaseDraenei extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "我们已经在外域中消灭了德莱尼人"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "你将从德莱尼人那掠夺500黄金和木材。埃索达也将变得可摧毁"
    endmethod

    private method OnComplete takes nothing returns nothing
      call AdjustPlayerStateBJ( 500, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call AdjustPlayerStateBJ( 500, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
      call SetUnitInvulnerable(gg_unit_h09W_3303, false)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("万年追杀", "德莱尼们从阿古斯逃到了外域。消灭他们所有人。", "ReplaceableTextures\\CommandButtons\\BTNEredarWarlockPurple.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_SHATTRAH))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TUUREM))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_HALAAR))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FARAHLON))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TELREDOR))
      call this.AddQuestItem(QuestItemExpire.create(660))
      return this
    endmethod
  endstruct

endlibrary