
library QuestLivingShadow requires QuestData, Artifact, LegendLordaeron, LegendTwilight, GeneralHelpers, GlobalQuest

  struct QuestLivingShadow extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Uther has discovered the Living Embodiment of Shadow in the ruins of the Twilight Citadel"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The Living Shadow and the Ashbringer Quest discovery"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddItemSafe(LEGEND_UTHER.Unit, ARTIFACT_LIVINGSHADOW.item) 
      call FACTION_LORDAERON.AddQuest(THE_ASHBRINGER)
      set THE_ASHBRINGER.Progress = QUEST_PROGRESS_INCOMPLETE
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Living Embodiment of Shadow", "The Dark Fortress looming over the Twilight Highlands is a beacon of darkness. Destroy it and clear the surrounding lands of evil.", "ReplaceableTextures\\CommandButtons\\BTNShadow Orb.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_UTHER, gg_rct_TwilightOutside, "Twilight Citadel"))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09F')))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_GRIMBATOL, false))
      return this
    endmethod
  endstruct

endlibrary