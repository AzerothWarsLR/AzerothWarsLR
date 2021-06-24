//Escapes Kalimdor, Find the Skull of Guldan
library QuestIllidanChapterTwo requires QuestData, QuestItemLegendInRect, QuestItemLegendDead, LegendNaga

  struct QuestIllidanChapterTwo extends QuestData
    private QuestData questToDiscover

    private method operator CompletionPopup takes nothing returns string
      return "Illidan has learned of the existence of the Skull of Gul'dan, hidden in Dalaran"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Chapter Two - The Aetheneum Secrets"
    endmethod

    private method OnComplete takes nothing returns nothing
      call questToDiscover.DisplayDiscovered()
    endmethod

    public static method create takes QuestData questToDiscover returns thistype
      local thistype this = thistype.allocate("Chapter One - The Aetheneum Secrets", "The hidden Aetheneum library holds many secrets, Illidan most uncover in order to gain the power he craves", "ReplaceableTextures\\CommandButtons\\BTNDoomlord.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_ILLIDAN, gg_rct_AethneumLibraryEntrance, "Aetheneum Library"))
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_ILLIDAN, gg_rct_ImmolFight, "Immol'thar Lair"))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_IMMOLTHAR))
      set this.questToDiscover = questToDiscover
      return this
    endmethod
  endstruct

endlibrary