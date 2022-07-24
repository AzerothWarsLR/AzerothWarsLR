library QuestSentinelsKillFrostwolf requires SentinelsSetup, LegendFrostwolf, Display

  globals
    private constant integer RESEARCH_ID = 'R052'
    private constant integer AMARA_ID = 'h03I'
  endglobals

  struct QuestSentinelsKillFrostwolf extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "霜狼氏族和他们的牛头人盟友已经被驱逐出卡利姆多。没人会怀念他们的。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得半英雄阿马拉和英雄加洛德"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(this.Holder.Player, AMARA_ID, "你现在可以在长老祭坛内复活阿玛拉了")
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(AMARA_ID, 1)
      call this.Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("把他们赶回去", "霜狼氏族开始在贫瘠之地和莫高雷平原上建立据点，他们必须被赶回去。", "ReplaceableTextures\\CommandButtons\\BTNThrall.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_THUNDERBLUFF))
      return this
    endmethod
  endstruct

endlibrary