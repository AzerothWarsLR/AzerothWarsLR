library QuestDefeatAzshara requires NzothSetup, LegendNaga, Display

  globals
    private constant integer QUEST_RESEARCH_ID = 'R08Y'  
  endglobals

  struct QuestDefeatAzshara extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "伊利丹击败了艾萨拉，控制了娜迦的军队"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "你可以训练海巫"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("征服纳沙塔尔", "艾萨拉仍然控制着娜迦帝国，征服它，为你的事业奴役更多娜迦", "ReplaceableTextures\\CommandButtons\\BTNNagaSummoner.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_NAZJATAR))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_VAULT, true))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary