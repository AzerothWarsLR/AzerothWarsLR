library QuestEastRaid requires QuestData, NzothSetup

  struct QuestEastRaid extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "We now control the southern coast of the Alliance and have raided their lands for riches"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain 200 gold and 3000 lumber"
    endmethod

    private method OnComplete takes nothing returns nothing
      call AdjustPlayerStateBJ(3500, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER)
      call AdjustPlayerStateBJ( 200, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Raiders from the Sea", "The southern coast of the Alliance is rip with riches, they are an easy target for our raiders", "ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidon.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n084')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n06W')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n08M')))
      return this
    endmethod
  endstruct

endlibrary