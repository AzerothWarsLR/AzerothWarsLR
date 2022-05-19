library QuestChaseDraenei requires QuestData

  struct QuestChaseDraenei extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "We have eradicated the Draenei from Outland"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The Draenei have fleed to Outland, chase them further and eliminate them."
    endmethod

    private method OnComplete takes nothing returns nothing
      call AdjustPlayerStateBJ( 500, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call AdjustPlayerStateBJ( 500, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Genocide of the Draenei", "The Draenei race existence insults the Eredar overlords of the Burning Legion, destroy them all ", "ReplaceableTextures\\CommandButtons\\BTNEredarRed.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_EXODARSHIP))
      return this
    endmethod
  endstruct

endlibrary