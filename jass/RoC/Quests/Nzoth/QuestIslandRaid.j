library QuestIslandRaid requires QuestData, NzothSetup

  struct QuestIslandRaid extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "We now control the islands and have plundered them for ressources."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain 200 gold and 3500 lumber and your food limit becomes 40"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerStateBJ( this.Holder.Player, PLAYER_STATE_FOOD_CAP_CEILING, 50 )
      call AdjustPlayerStateBJ(3500, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER)
      call AdjustPlayerStateBJ( 200, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Plunder the Islands", "The Sea rejects many treasures on the islands. Control the area to uncover those lost ressources", "ReplaceableTextures\\CommandButtons\\BTNChestOfGold.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n05Y')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09C')))
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_NAZJAR, gg_rct_Broken_Isles, "Broken Isles"))
      return this
    endmethod
  endstruct

endlibrary