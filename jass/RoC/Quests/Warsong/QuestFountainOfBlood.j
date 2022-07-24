library QuestFountainOfBlood requires QuestData, WarsongSetup, LegendNeutral

  globals
    private constant integer RESEARCH_ID = 'R00X'
  endglobals

  struct QuestFountainOfBlood extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "鲜血之泉现在在战歌的控制之下。当兽人喝下它的时候，他们感到一种熟悉的愤怒在他们体内苏醒"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "允许兽人单位短暂地提高攻击速度和移动速度"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("玛诺洛斯之血", "很久以前，兽人们喝了玛诺洛斯的血，并被注入了恶魔般的愤怒。只要尝一尝他的鲜血就会重新点燃那些力量。", "ReplaceableTextures\\CommandButtons\\BTNFountainOfLifeBlood.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_FOUNTAINOFBLOOD, false))
      return this
    endmethod
  endstruct

endlibrary