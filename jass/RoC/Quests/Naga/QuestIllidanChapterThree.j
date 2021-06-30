//Escapes Kalimdor, Find the Skull of Guldan
library QuestIllidanChapterThree requires QuestData, QuestItemLegendReachRect, QuestItemLegendDead, LegendNaga

  struct QuestIllidanChapterThree extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "Illidan must awaken the Naga from the depth of the ocean"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Nazjatar and the Naga's loyalty"
    endmethod

    private method OnComplete takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Chapter Three: Dwellers from the Deep", "Awakening the Naga's will give Illidan the army he needs to achieve his goals", "ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidon.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_MaelstromAmbient, "the Maelstrom"))
      return this
    endmethod
  endstruct

endlibrary  