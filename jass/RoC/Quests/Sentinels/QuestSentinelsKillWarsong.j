library QuestSentinelsKillWarsong requires SentinelsSetup, LegendWarsong, Display

  globals
    private constant integer RESEARCH_ID = 'R007'
  endglobals

  struct QuestSentinelsKillWarsong extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "卡利姆多上战歌的存在已经被抹除了。这片土地受到保护，免受那兽人之害。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "允许建造守望者堡垒"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("绿皮肤的畜生", "战歌氏族已经抵达灰谷附近，并威胁到了荒野。必须击退这些入侵者。", "ReplaceableTextures\\CommandButtons\\BTNRaider.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_STONEMAUL))
      return this
    endmethod
  endstruct

endlibrary