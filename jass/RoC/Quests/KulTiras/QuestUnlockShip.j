library QuestUnlockShip requires QuestData, ScarletSetup, GeneralHelpers

  struct QuestUnlockShip extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Proudmoore capital ship is now ready to set sails!"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Unpause the Proudmoore capital ship and unlocks the buildings inside."
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_ShipAmbient, this.Holder.Player)
      call PauseUnitBJ( false, gg_unit_h08T_0260 )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Zandalar Menace", "The Troll Empire of Zandalar is a danger to the safety of Kul'tiras and the Alliance. Before setting sail, we must eliminate them.", "ReplaceableTextures\\CommandButtons\\BTNGalleonIcon.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_DAZARALOR, false))
      return this
    endmethod
  endstruct

endlibrary