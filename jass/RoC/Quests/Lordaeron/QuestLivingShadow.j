
library QuestLivingShadow requires QuestData, Artifact, LegendLordaeron, LegendTwilight, GeneralHelpers, GlobalQuest

  struct QuestLivingShadow extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "乌瑟尔在暮光堡垒的废墟中发现了活体虚空"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得活体虚空并开启灰烬使者任务"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddItemSafe(LEGEND_UTHER.Unit, ARTIFACT_LIVINGSHADOW.item) 
      call FACTION_LORDAERON.AddQuest(THE_ASHBRINGER)
      set THE_ASHBRINGER.Progress = QUEST_PROGRESS_INCOMPLETE
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("活体虚空", "竖立在暮光高地上的暮光堡垒是黑暗的灯塔。摧毁它并清除掉周围的邪恶之地。", "ReplaceableTextures\\CommandButtons\\BTNShadow Orb.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_UTHER, gg_rct_TwilightOutside, "暮光堡垒"))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09F')))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_GRIMBATOL, false))
      return this
    endmethod
  endstruct

endlibrary