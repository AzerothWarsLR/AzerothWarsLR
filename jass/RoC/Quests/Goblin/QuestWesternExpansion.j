library QuestWesternExpansion requires LegendSentinels, Display, QuestItemLegendDead

  globals
    private constant integer QUEST_RESEARCH_ID = 'R07Y' 
  endglobals

  struct QuestWesternExpansion extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "西部海岸现在没有讨厌的精灵了，我们的业务也可以继续扩张了，飞艇也可以安全的飞行了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "解锁" + GetObjectName('h091') + "单位"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("西部扩张", "羽月要塞和奥伯丁让精灵们控制了卡利姆多的西海岸。我们需要摧毁它们来为我们向西拓展的业务扫清道路！", "ReplaceableTextures\\CommandButtons\\BTNNightElfShipyard.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FEATHERMOON))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_AUBERDINE))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary