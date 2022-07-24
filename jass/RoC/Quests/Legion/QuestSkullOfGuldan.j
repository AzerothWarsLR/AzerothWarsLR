library QuestSkullOfGuldan requires QuestData, Artifact, LegionSetup, QuestItemAnyUnitInRect, QuestItemEitherOf, QuestItemFactionDefeated, QuestItemLegendDead, GeneralHelpers

  struct QuestSkullOfGuldan extends QuestData
    private QuestItemAnyUnitInRect questItemAnyUnitInRect

    private method operator CompletionPopup takes nothing returns string
      return "古尔丹之颅已经被" + GetHeroProperName(questItemAnyUnitInRect.TriggerUnit) + "取回。它邪恶的力量将为燃烧军团在艾泽拉斯的行动提供支援。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "古尔丹之颅"
    endmethod   

    private method OnComplete takes nothing returns nothing
      call ARTIFACT_SKULLOFGULDAN.setStatus(ARTIFACT_STATUS_GROUND)
      call UnitAddItemSafe(questItemAnyUnitInRect.TriggerUnit, ARTIFACT_SKULLOFGULDAN.item)
    endmethod

    private method OnFail takes nothing returns nothing
      call SetItemPosition(ARTIFACT_SKULLOFGULDAN.item, -11867, 22216.5)
      call ARTIFACT_SKULLOFGULDAN.setStatus(ARTIFACT_STATUS_GROUND)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("古尔丹之颅", "术士大师古尔丹的颅骨被达拉然的法师们保护了起来。它的正统所有权属于燃烧军团。", "ReplaceableTextures\\CommandButtons\\BTNGuldanSkull.blp")
      set this.questItemAnyUnitInRect = this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_DalaranDungeon, "达拉然地牢", true))
      call this.AddQuestItem(QuestItemEitherOf.create(QuestItemLegendDead.create(LEGEND_ILLIDAN), QuestItemFactionDefeated.create(FACTION_NAGA)))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary