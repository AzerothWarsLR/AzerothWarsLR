library QuestWestRaid requires QuestData, NzothSetup

  struct QuestWestRaid extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "We now control the Azshara Coast and have uncovered some lost treasures from the ruins."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain 200 gold and 3500 lumber"
    endmethod

    private method OnComplete takes nothing returns nothing
      call AdjustPlayerStateBJ(3500, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER)
      call AdjustPlayerStateBJ( 200, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Azshara Coast", "There are many forgotten riches in the ruins of Azshara Coast, if we can control the area, we will obtain those treasures", "ReplaceableTextures\\CommandButtons\\BTNShrineOfAszhara.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01S')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09R')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BM')))
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_NAZJAR, gg_rct_Broken_Isles, "Broken Isles"))
      return this
    endmethod
  endstruct

endlibrary