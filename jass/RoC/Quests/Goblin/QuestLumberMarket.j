library QuestLumberMarket requires GoblinSetup, LegendDruids

  globals
    private constant integer QUEST_RESEARCH_ID = 'R07Z'   //This research is given when the quest is completed
  endglobals

  struct QuestLumberMarket extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "世界之树是我们的了，我们的木材供应将永远不会耗尽！"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "伐木机获得分裂攻击和500点生命值。你将获得30000木头。"
    endmethod

    private method OnComplete takes nothing returns nothing
      call AdjustPlayerStateBJ( 30000, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("木材市场崩溃", "世界之树提供的木材足以彻底摧毁木材市场，迫使我们的伐木机更加专注于战争。", "ReplaceableTextures\\CommandButtons\\BTNJunkGolem.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_NORDRASSIL, false))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary