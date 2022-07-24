
library QuestBladeOfTheBlackEmpire requires QuestData, Artifact, LegendBlackEmpire, LegendNeutral, GeneralHelpers, GlobalQuest

  struct QuestBladeOfTheBlackEmpire extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "传令官沃拉兹找到了萨拉塔斯，黑暗帝国之刃"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "萨拉塔斯将会是我们的并开启提尔之墓任务"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddItemSafe(LEGEND_VOLAZJ.Unit, ARTIFACT_XALATATH.item) 
      call FACTION_BLACKEMPIRE.AddQuest(TOMB_OF_TYR)
      set TOMB_OF_TYR.Progress = QUEST_PROGRESS_INCOMPLETE
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("黑暗帝国之刃", "存在于一把被诅咒之刃内的萨拉塔斯是侍奉着古神中的最古老、最强大的存在之一。一位人类牧师在很久以前偷走了它并与她一起埋葬在暮色森林的墓穴内。", "ReplaceableTextures\\CommandButtons\\BTNmidnightGS.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_VOLAZJ, gg_rct_DuskwoodCrypt, "暮色森林墓地墓穴"))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_DUSKWOODGRAVEYARD, false))
      return this
    endmethod
  endstruct

endlibrary