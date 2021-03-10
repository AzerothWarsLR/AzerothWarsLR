library QuestWarsongKillDruids requires WarsongSetup, LegendDruids, Display

  globals
    private constant integer RESEARCH_ID = 'R059'
  endglobals

  struct QuestWarsongKillDruids extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Nordrassil has been captured. Goblin Shredders begin immediate harvesting operations and are outfitted with newer, more effective equipment."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "A research allowing your Goblin Shredders to use Emergency Repairs, Pocket Factory, and Saw Bombardment"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call DisplayResearchAcquired(this.Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Tear It Down", "The World Tree, Nordrassil, is the Night Elves' source of immortality. Capture it to cripple the Druids and supply the Warsong with an incredible source of lumber.","ReplaceableTextures\\CommandButtons\\BTNFountainOfLife.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_NORDRASSIL, false))
      return this
    endmethod
  endstruct

endlibrary