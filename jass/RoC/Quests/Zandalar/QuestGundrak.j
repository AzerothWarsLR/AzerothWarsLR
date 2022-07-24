library QuestGundrak requires LegendNeutral

  globals
    private constant integer GUNDRAK_RESEARCH = 'R02Q'
    private constant integer WARLORD_ID = 'nftk'
    private constant integer TROLL_SHRINE_ID = 'o04X'
  endglobals

  struct QuestGundrak extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "古达克已经被攻陷了。达卡莱巨魔们向" + this.Holder.Team.Name + "伸出了援手"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得古达克，300黄金并允许在" + GetObjectName(TROLL_SHRINE_ID) + "内训练" + GetObjectName(WARLORD_ID) + "单位"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, GUNDRAK_RESEARCH, 1)
      call AdjustPlayerStateBJ( 300, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(GUNDRAK_RESEARCH, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("达卡莱要塞", "古达克的达卡莱巨魔相信他们的堡垒坚不可摧。占领它来赢得他们的忠诚。", "ReplaceableTextures\\CommandButtons\\BTNTerrorTroll.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_GUNDRAK, false))
      return this
    endmethod
  endstruct

endlibrary