library QuestChaseDraenei requires QuestData

  struct QuestChaseDraenei extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "We have eradicated the Draenei from Outland"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You will plunder 500 gold and lumber from the Draenei. The Exodar will also be made vulnerable"
    endmethod

    private method OnComplete takes nothing returns nothing
      call AdjustPlayerStateBJ( 500, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call AdjustPlayerStateBJ( 500, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
      call SetUnitInvulnerable(gg_unit_h09W_3303, false)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Chase across the Eons", "The Draenei have escaped Argus, they have run away to Outland. Elimimnate them all.", "ReplaceableTextures\\CommandButtons\\BTNEredarWarlockPurple.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_SHATTRAH))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_HALAAR))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FARAHLON))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TELREDOR))
      call this.AddQuestItem(QuestItemExpire.create(660))
      return this
    endmethod
  endstruct

endlibrary