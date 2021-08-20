//Survive and defend the city
library QuestGilneasChapterTwo requires QuestData, QuestItemTime, Artifact

  globals
    private constant integer DARIUS_ID = 'Hpb2'
  endglobals

  struct QuestGilneasChapterTwo extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "The origin of the curse has been found, the wizard Arugal is the culprit."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Chapter Three: The Blackwald"
    endmethod

    private method OnComplete takes nothing returns nothing
    call Holder.modObjectLimit(DARIUS_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Chapter Two: The Defense of Gilneas", "Defend the city until a cure for the curse of worgen is found. Do not let the Cathedral and Castle be destroyed", "ReplaceableTextures\\CommandButtons\\BTNGilneanCastle.blp")
     call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_TESS, gg_rct_Chapter2Start, "Base camp")) 
     call this.AddQuestItem(QuestItemTime.create(1560))
      return this
    endmethod
  endstruct

endlibrary