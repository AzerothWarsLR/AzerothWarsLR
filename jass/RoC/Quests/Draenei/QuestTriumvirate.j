library QuestTriumvirate requires DraeneiSetup, QuestItemControlPoint, GeneralHelpers

  struct QuestTriumvirate extends QuestData
    private method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "Velen has liberated Argus and re-assembled the Crown of Triumvirate"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You gain the powerful item, the Crown of the Triumvirate"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddItemSafe(LEGEND_VELEN.Unit, ARTIFACT_CROWNTRIUMVIRATE.item)
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Crown of the Triumvirate", "Eons ago, the council that led the Eredar was the Triumvirate. If Velen could reconquer Argus, he could reform the Crown of the Triumvirate", "ReplaceableTextures\\CommandButtons\\BTNNeverMeltingCrown.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BH')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BL')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09X')))
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_VELEN))
      return this
    endmethod
  endstruct

endlibrary