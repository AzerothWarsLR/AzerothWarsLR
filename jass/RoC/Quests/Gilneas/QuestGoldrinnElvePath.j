library QuestGoldrinnElvePath requires QuestData, GilneasSetup

  globals
    private constant integer QUEST_RESEARCH_ID = 'R07U'   //This research is given when the quest is completed
  endglobals

  struct QuestGoldrinnElvePath extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "Goldrinn has joined Gilneas"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Goldrinn will be trainable at the altar"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Shrine of the Wolf God", "To understand the plight of her people, Tess will go to the Shrine of Goldrinn in Hyjal to understand what it is to be a Worgen.", "ReplaceableTextures\\CommandButtons\\BTNWorgenMoon.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_TESS, gg_rct_GoldrinnHyjal, "Shrine of Goldrinn in Mount Hyjal"))
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_GENN))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary