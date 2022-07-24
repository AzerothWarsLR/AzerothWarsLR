library QuestMoreWyverns requires LegendSentinels, Display, QuestItemLegendDead

  globals
    private constant integer UNITTYPE_ID = 'owyv'
    private constant integer LIMIT_CHANGE = 2
  endglobals

  struct QuestMoreWyverns extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "哨兵已经被消灭了。萨尔酋长在知道他的人民现在暂时是安全的后松了一口气。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "允许训练" + I2S(LIMIT_CHANGE) + "个" + GetObjectName(UNITTYPE_ID) + "单位"
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.Holder.ModObjectLimit(UNITTYPE_ID, LIMIT_CHANGE)
      call DisplayUnitLimit(this.Holder, UNITTYPE_ID)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("完美战士", "哨兵的英勇和野蛮是值得尊敬的，也是令人畏惧的。必须消灭她们。", "ReplaceableTextures\\CommandButtons\\BTNArcher.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FEATHERMOON))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_AUBERDINE))
      return this
    endmethod
  endstruct

endlibrary