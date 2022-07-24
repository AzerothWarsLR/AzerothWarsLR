library QuestJergosh requires QuestData, Artifact, LegendWarsong, GeneralHelpers

  globals
    private constant integer QUEST_RESEARCH_ID = 'R08N'   //This research is given when the quest is completed
  endglobals

  struct QuestJergosh extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "格罗姆已经找到了古尔丹的尸体"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "祭坛内可以召唤祈求者耶戈什"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("古尔丹的遗骸", "传说术士古尔丹在寻找萨格拉斯之眼的过程中死亡。他的尸体应该含有能增强我们术士的秘密。", "ReplaceableTextures\\CommandButtons\\BTNGuldan.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_GROM, gg_rct_InstanceSargerasTomb, "古尔丹的遗骸"))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00J')))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary