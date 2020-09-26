library QuestFrostwolfKillSentinels requires WarsongConfig, LegendDruids, Display

  globals
    private constant integer RESEARCH_ID = 'R059'
  endglobals

  struct QuestFrostwolfKillSentinels extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Nordrassil has been captured. Goblin Shredders begin immediate harvesting operations and are outfitted with newer, more effective equipment."
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call DisplayResearchAcquired(this.Holder.Player, RESEARCH_ID, 1)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Tear It Down", "The World Tree, Nordrassil, is the Night Elves' source of immortality. Capture it to cripple the Druids and supply the Warsong with an incredible source of lumber.","ReplaceableTextures\\CommandButtons\\BTNFountainOfLife.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FEATHERMOON))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_AUBERDINE))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_WARSONG.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary