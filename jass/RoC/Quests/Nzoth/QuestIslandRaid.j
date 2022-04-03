library QuestIslandRaid requires QuestData, NzothSetup

  struct QuestIslandRaid extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "We now control the islands and have plundered them for ressources."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain 200 gold and 3500 lumber"
    endmethod

    private method OnComplete takes nothing returns nothing
      call AdjustPlayerStateBJ(3500, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER)
      call AdjustPlayerStateBJ( 200, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Plunder the Islands", "The Sea rejects many treasures on the islands. Control the area to uncover those lost ressources", "ReplaceableTextures\\CommandButtons\\BTNChestOfGold.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n05Y')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BW')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09C')))
      return this
    endmethod
  endstruct

endlibrary