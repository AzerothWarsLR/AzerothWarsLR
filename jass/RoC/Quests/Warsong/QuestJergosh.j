library QuestJergosh requires QuestData, Artifact, LegendWarsong, GeneralHelpers

  globals
    private constant integer QUEST_RESEARCH_ID = 'R08N'   //This research is given when the quest is completed
  endglobals

  struct QuestJergosh extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Grom has found the body of Gul'dan"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Jergosh the Invoker is now trainable at the altar"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Gul'dan's Remains", "The legendary warlock Gul'dan is said to have perished in his quest to find the eye of Sargeras. His body should contain secrets of unfathomable power for our Warlocks", "ReplaceableTextures\\CommandButtons\\BTNGuldan.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_GROM, gg_rct_InstanceSargerasTomb, "Gul'dan Remains"))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00J')))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary