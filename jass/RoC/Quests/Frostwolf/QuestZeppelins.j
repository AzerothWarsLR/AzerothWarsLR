library QuestZeppelins requires LegendSentinels, Display

  globals
    private constant integer RESEARCH_ID = 'R058'
    private constant integer UNITTYPE_ID = 'nzep'
    private constant integer LIMIT_CHANGE = 2
  endglobals

  struct QuestZeppelins extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "哨兵们已经被击败。天空中没有了角鹰兽们威胁后，部落终于可以将飞艇部署到战场之上了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "解锁训练" + GetObjectName(UNITTYPE_ID) + "单位"
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(UNITTYPE_ID, LIMIT_CHANGE)
      call this.Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(this.Holder.Player, UNITTYPE_ID, "你现在可以在地精实验室内训练飞艇单位了。")
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("灰谷之魂", "卡利姆多大陆上到处都是哨兵。只要她们还活着一天，兽人就永远不会安全。", "ReplaceableTextures\\CommandButtons\\BTNGoblinZeppelin.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_AUBERDINE))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FEATHERMOON))
      return this
    endmethod
  endstruct

endlibrary