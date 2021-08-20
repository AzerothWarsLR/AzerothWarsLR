//Kill Arugal
library QuestGilneasChapterThree requires QuestData, QuestItemLegendReachRect, QuestItemLegendDead

   globals
    private constant integer RESEARCH_ID = 'R02R'
  endglobals
 
  struct QuestGilneasChapterThree extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "Illidan must awaken the Naga from the depth of the ocean"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Nazjatar and the Naga's loyalty"
    endmethod

    private method OnComplete takes nothing returns nothing
    call Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
    call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Chapter Three: The Blackwald", "Killing Arugal will bring an end to the Worgen Curse, he holds the Scythe of Elune that will give the worgen their sanity", "ReplaceableTextures\\CommandButtons\\BTNfinger of death .blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_TESS, gg_rct_StartQuest3, "The city is safe"))
      call this.AddQuestItem(QuestItemLegendHasArtifact.create(LEGEND_TESS, ARTIFACT_SCYTHEOFELUNE))
      call this.AddQuestItem(QuestItemLegendAlive.create(LEGEND_GENN))
      return this
    endmethod
  endstruct

endlibrary  