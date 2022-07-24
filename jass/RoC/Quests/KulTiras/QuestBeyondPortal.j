library QuestBeyondPortal requires QuestData, KultirasSetup, GeneralHelpers

 globals
    private constant integer QUEST_RESEARCH_ID = 'R085'   //This research is given when the quest is completed
  endglobals

  struct QuestBeyondPortal extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The orcs are no more and we can now train Fusillier."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You will be able to train Fusillier from the Barrack"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Beyond the Dark Portal", "The Orc threat from Draenor still looms over all. Eliminate every trace of the Orcs and their bases.", "ReplaceableTextures\\CommandButtons\\BTNDarkPortal.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_BLACKTEMPLE, false))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_HELLFIRECITADEL))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_BLACKROCKSPIRE))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary