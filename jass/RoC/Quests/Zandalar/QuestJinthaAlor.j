library QuestJinthaAlor requires LegendNeutral

  globals
    private constant integer JINTHAALOR_RESEARCH = 'R02N'
    private constant integer BEAR_RIDER_ID = 'o02K'
    private constant integer TROLL_SHRINE_ID = 'o04X'
  endglobals

  struct QuestJinthaAlor extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "辛萨罗已经沦陷。邪枝巨魔把他们的力量借给了" + this.Holder.Team.Name + "。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得辛萨罗，300黄金并允许在" + GetObjectName(TROLL_SHRINE_ID) + "内训练" + GetObjectName(BEAR_RIDER_ID) + "单位"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, JINTHAALOR_RESEARCH, 1)
      call AdjustPlayerStateBJ( 300, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(JINTHAALOR_RESEARCH, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("远古之卵", "辛萨罗的邪枝巨魔被对隐藏在神龛中的吞灵者的卵的恐惧所控制。粉碎它以获得他们的忠诚。", "ReplaceableTextures\\CommandButtons\\BTNForestTrollShadowPriest.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_JINTHAALOR, false))
      return this
    endmethod
  endstruct

endlibrary