//Kill Arugal
library QuestGilneasChapterThree requires QuestData, QuestItemLegendReachRect, QuestItemLegendDead

   globals
    private constant integer RITUAL_ID = 'A0KY'
  endglobals
 
  struct QuestGilneasChapterThree extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "Illidan must awaken the Naga from the depth of the ocean"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Nazjatar and the Naga's loyalty"
    endmethod

    private method OnComplete takes nothing returns nothing
    set FACTION_GILNEAS.Team = TEAM_NORTH_ALLIANCE
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Chapter Three: The dark forest", "Killing Arugal will bring an end to the Worgen Curse, he holds the Scythe of Elune that will give the worgen their sanity", "ReplaceableTextures\\CommandButtons\\BTNfinger of death .blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_TESS, gg_rct_StartQuest3, "The city is safe"))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_ARUGAL))
      call this.AddQuestItem(QuestItemLegendAlive.create(LEGEND_GENN))
      return this
    endmethod
  endstruct

endlibrary  