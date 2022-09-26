library QuestSurvivorsShattrah requires QuestData, DraeneiSetup

  globals
    private constant integer QUESTRESEARCH_ID = 'R082'   //This research is given when the quest is completed
  endglobals
  
  struct QuestSurvivorsShattrah extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "The hero Maraad is now trainable at the Altar"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Maraad will join the survivors on the Exodar"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Survivors of Shattrah", "The Shattrah massacre was swift and brutal, if the Draenei hold long enough in Outland, they might regroup with some of the survivors.", "ReplaceableTextures\\CommandButtons\\BTNGlazeroth.blp")
      call this.AddQuestItem(QuestItemTime.create(420))
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_EXODARSHIP))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUESTRESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary