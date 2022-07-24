//Escapes Kalimdor, Find the Skull of Guldan
library QuestIllidanChapterTwo requires QuestData, QuestItemLegendReachRect, QuestItemLegendDead, LegendNaga, Artifact

  struct QuestIllidanChapterTwo extends QuestData

    private QuestData questToDiscover

    private method operator CompletionPopup takes nothing returns string
      return "伊利丹已经知道古尔丹之颅就藏在达拉然之中"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "第三章: 来自深海的居民"
    endmethod

    private method OnComplete takes nothing returns nothing
      set LEGEND_ILLIDAN.UnitType = 'Eevi'
      set questToDiscover.Progress = QUEST_PROGRESS_INCOMPLETE
    endmethod

    public static method create takes QuestData questToDiscover returns thistype
      local thistype this = thistype.allocate("第二章：古尔丹之颅", "达拉然的法师们将一个强大的神器，古尔丹之颅，藏了起来，而它能够赋予伊利丹无限的力量", "ReplaceableTextures\\CommandButtons\\BTNGuldanSkull.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_IllidanBoat1, "逃生小船"))
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_SkullOfGuldan, "达拉然地牢"))
      call this.AddQuestItem(QuestItemLegendHasArtifact.create(LEGEND_ILLIDAN, ARTIFACT_SKULLOFGULDAN))
      set this.questToDiscover = questToDiscover

      return this
    endmethod
  endstruct

endlibrary