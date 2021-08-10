//Reach Gilneas City
library QuestGilneasChapterOne requires QuestData, QuestItemLegendReachRect, LegendGilneas

  struct QuestGilneasChapterOne extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "Gilneas City is under attack, you must defend it at all cost."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Chapter Two - The defense of Gilneas"
    endmethod

    private method OnComplete takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Chapter One: The Aetheneum Secrets", "The hidden Aetheneum library holds many secrets, Illidan most uncover in order to gain the power he craves", "ReplaceableTextures\\CommandButtons\\BTNDoomlord.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_TESS, gg_rct_Chapter2Map, "Gilneas City"))
      return this
    endmethod
  endstruct

endlibrary