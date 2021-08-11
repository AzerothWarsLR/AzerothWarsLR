//Escapes Kalimdor, Find the Skull of Guldan
library QuestGilneasChapterThree requires QuestData, QuestItemLegendReachRect, QuestItemLegendDead, LegendNaga

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
      local thistype this = thistype.allocate("Chapter Three: Dwellers from the Deep", "Awakening the Naga's will give Illidan the army he needs to achieve his goals", "ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidon.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_StartQuest3, "the exit"))
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_MaelstromAmbient, "the Maelstrom"))
      call this.AddQuestItem(QuestItemCastSpell.create(RITUAL_ID, true))
      return this
    endmethod
  endstruct

endlibrary  