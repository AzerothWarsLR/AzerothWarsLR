library QuestDruidsKillFrostwolf requires DruidsConfig, LegendFrostwolf, Display

  globals
    private constant integer RESEARCH_ID = 'R044'
    private constant integer ELEMENTAL_GUARDIAN_ID = 'e00X'
  endglobals

  struct QuestDruidsKillFrostwolf extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Frostwolves have been driven from Kalimdor. Their departure reveals the existence of a powerful nature spirit that now heeds the call of the Druids."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Learn to train the " + GetObjectName(ELEMENTAL_GUARDIAN_ID) + " from the Altar of Elders"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(this.Holder.Player, ELEMENTAL_GUARDIAN_ID, "You can now train the Elemental Guardian from the Altar of Elders.")
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(ELEMENTAL_GUARDIAN_ID, 1)
      call this.Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Natural Contest", "The Frostwolf Clan has arrived on the shores of Kalimdor. Though their respect of the wild spirits is to be admired, their presence cannot be tolerated.", "ReplaceableTextures\\CommandButtons\\BTNHeroTaurenChieftain.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_ORGRIMMAR))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_THUNDERBLUFF))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_DRUIDS.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary