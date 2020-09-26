library QuestLegionKillLordaeron requires LegionConfig, LegendLordaeron, LegendLegion, Display

  struct QuestLegionKillLordaeron extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Kingdom of Lordaeron has fallen, eliminating Azeroth's vanguard against the Legion."
    endmethod

    private method OnComplete takes nothing returns nothing
      call DisplayHeroReward(LEGEND_TICHONDRIUS.Unit, 15, 15, 15, 0)
      call AddHeroAttributes(LEGEND_TICHONDRIUS.Unit, 15, 15, 15)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Token Resistance", "The Kingdom of Lordaeron must be eliminated to pave the way for the Legion's arrival.", FACTION_LORDAERON.Icon)
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_CAPITALPALACE))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_STRATHOLME))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TYRSHAND))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_LORDAERON.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary