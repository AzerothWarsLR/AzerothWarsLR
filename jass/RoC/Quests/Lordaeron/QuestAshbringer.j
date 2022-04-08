library QuestAshbringer requires QuestData, Artifact, LordaeronSetup, GeneralHelpers

  globals
    private constant real DUMMY_X = 22700
    private constant real DUMMY_Y = 23734
  endglobals

  struct QuestAshbringer extends QuestData
    
    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "The Ashbringer has been forged and Mograine has returned from exile to wield it"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain the hero Mograine and the artifact Ashbringer"
    endmethod

    private method OnComplete takes nothing returns nothing
      call LEGEND_MOGRAINE.Spawn(Holder.Player, GetRectCenterX(gg_rct_AshbringerForge), GetRectCenterY(gg_rct_AshbringerForge), 270)
      call SetHeroLevel(LEGEND_MOGRAINE.Unit, 10, false)
      call UnitAddItemSafe(LEGEND_MOGRAINE.Unit, ARTIFACT_ASHBRINGER.item) 
      call SetItemPosition(ARTIFACT_LIVINGSHADOW.item, DUMMY_X, DUMMY_Y)
      call ARTIFACT_LIVINGSHADOW.setStatus(ARTIFACT_STATUS_HIDDEN)
      call ARTIFACT_LIVINGSHADOW.setDescription("Used to create the Ashbringer")
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Ashbringer", "The Living Shadow must be purged, with enough Holy Magic and the craftiness of the Dwarves, it could be reforged into the strongest weapon of the Light", "ReplaceableTextures\\CommandButtons\\BTNAshbringer2.blp")
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_LIVINGSHADOW))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n015')))
      call this.AddQuestItem(QuestItemArtifactInRect.create(ARTIFACT_LIVINGSHADOW, gg_rct_AshbringerForge, "The Great Forge"))
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_AshbringerForge, "The Great Forge", LEGEND_UTHER, 120, 340))
      return this
    endmethod
  endstruct

endlibrary