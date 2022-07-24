library QuestZulgurub requires LegendNeutral

  globals
    private constant integer ZULGURUB_RESEARCH = 'R02M'
    private constant integer TROLL_SHRINE_ID = 'o04X'
    private constant integer RAVAGER_ID = 'o021'
  endglobals

  struct QuestZulgurub extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "祖尔格拉布沦陷了。古鲁巴希巨魔将他们的力量借给了" + this.Holder.Team.Name  + "。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得祖尔格拉布，300黄金并允许在" + GetObjectName(TROLL_SHRINE_ID) + "内训练" + GetObjectName(RAVAGER_ID) + "单位"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, ZULGURUB_RESEARCH, 1)
      call AdjustPlayerStateBJ( 300, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(ZULGURUB_RESEARCH, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("哈卡之心", "祖尔古鲁布的古拉巴什巨魔跟随隐藏在神殿内的哈卡之心。夺取它来赢得他们的忠诚。", "ReplaceableTextures\\CommandButtons\\BTNTrollRavager.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ZULGURUB, false))
      return this
    endmethod
  endstruct

endlibrary