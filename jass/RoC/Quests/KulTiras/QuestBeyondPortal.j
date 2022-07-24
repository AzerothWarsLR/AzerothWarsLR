library QuestBeyondPortal requires QuestData, KultirasSetup, GeneralHelpers

 globals
    private constant integer QUEST_RESEARCH_ID = 'R085'   //This research is given when the quest is completed
  endglobals

  struct QuestBeyondPortal extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "兽人已经成为了过去式，现在可以训练燧发枪手单位了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "允许在兵营内训练燧发枪手单位"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("黑暗之门以外", "来自德拉诺的兽人威胁仍笼罩着所有人，把兽人和他们的基地消灭干净。", "ReplaceableTextures\\CommandButtons\\BTNDarkPortal.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_BLACKTEMPLE, false))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_HELLFIRECITADEL))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_BLACKROCKSPIRE))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary