library QuestSentinelsKillWarsong requires SentinelsConfig, LegendWarsong, Display

  struct QuestSentinelsKillWarsong extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Warsong presence on Kalimdor has been eliminated. The land has been protected from their misbegotten race.", 
    endmethod

    private method OnComplete takes nothing returns nothing
      call DisplayHeroReward(LEGEND_SHANDRIS.Unit, 10, 10, 10, 0)
      call AddHeroAttributes(LEGEND_SHANDRIS.Unit, 10, 10, 10)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Green-skinned Brutes", "The Warsong Clan has arrived near Ashenvale and begun threatening the wilds. These invaders must be repelled.", "ReplaceableTextures\\CommandButtons\\BTNRaider.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_STONEMAUL))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_ENCAMPMENT))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_SENTINELS.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary