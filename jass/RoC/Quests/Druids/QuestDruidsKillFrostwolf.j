library QuestDruidsKillFrostwolf requires DruidsSetup, LegendFrostwolf, Display

  globals
    private constant integer RESEARCH_ID = 'R044'
    private constant integer ELEMENTAL_GUARDIAN_ID = 'e00X'
  endglobals

  struct QuestDruidsKillFrostwolf extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "霜狼已经被赶出卡利姆多。他们的离去揭示一种强大的自然灵魂存在，而祂现在回应了德鲁伊们的召唤。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "半英雄" + GetObjectName(ELEMENTAL_GUARDIAN_ID)
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(this.Holder.Player, ELEMENTAL_GUARDIAN_ID, "你现在可以在长者祭坛内召唤元素守护者")
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(ELEMENTAL_GUARDIAN_ID, 1)
      call this.Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("自然竞赛", "霜狼氏族已经抵达卡利姆多的海岸。尽管他们对于荒野灵魂的尊重值得赞赏，但他们的存在是不能被容忍的。", "ReplaceableTextures\\CommandButtons\\BTNHeroTaurenChieftain.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_THUNDERBLUFF))
      return this
    endmethod
  endstruct

endlibrary