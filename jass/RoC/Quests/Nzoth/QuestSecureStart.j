library QuestSecureStart requires QuestData, NzothSetup

  struct QuestSecureStart extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The depth of the Sea is now under Aszhara control."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain 150 gold and unlock the exits to Nazjatar"
    endmethod

    private method OnComplete takes nothing returns nothing
      call AdjustPlayerStateBJ( 150, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call WaygateActivateBJ( true, gg_unit_h01D_3381 )
      call WaygateSetDestinationLocBJ( gg_unit_h01D_3381, GetRectCenter(gg_rct_NazjatarEntrance1) )
      call WaygateActivateBJ( true, gg_unit_h01D_3384 )
      call WaygateSetDestinationLocBJ( gg_unit_h01D_3384, GetRectCenter(gg_rct_NazjatarEntrance2) )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Ocean's Depth", "We need to secure the depth of the Sea before moving out, take out the nearby monsters to open the way out of Nazjatar", "ReplaceableTextures\\CommandButtons\\BTNSeaTurtleRed.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n05W')))
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_ntrd_2592)) //Big Turtle
      return this
    endmethod
  endstruct

endlibrary