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
      return "灰烬使者已经被锻造，而莫格莱尼也从流放中归来并挥舞这把武器"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得莫格莱尼和神器灰烬使者"
    endmethod

    private method OnComplete takes nothing returns nothing
      call LEGEND_MOGRAINE.Spawn(Holder.Player, GetRectCenterX(gg_rct_AshbringerForge), GetRectCenterY(gg_rct_AshbringerForge), 270)
      call SetHeroLevel(LEGEND_MOGRAINE.Unit, 10, false)
      call UnitAddItemSafe(LEGEND_MOGRAINE.Unit, ARTIFACT_ASHBRINGER.item) 
      call SetItemPosition(ARTIFACT_LIVINGSHADOW.item, DUMMY_X, DUMMY_Y)
      call ARTIFACT_LIVINGSHADOW.setStatus(ARTIFACT_STATUS_HIDDEN)
      call ARTIFACT_LIVINGSHADOW.setDescription("用于锻造灰烬使者")
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("灰烬使者", "活体虚空必须用大量的圣光和矮人高超的手艺来净化并锻造成最强大的圣光武器", "ReplaceableTextures\\CommandButtons\\BTNAshbringer2.blp")
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_LIVINGSHADOW))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n015')))
      call this.AddQuestItem(QuestItemArtifactInRect.create(ARTIFACT_LIVINGSHADOW, gg_rct_AshbringerForge, "大熔炉"))
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_AshbringerForge, "大熔炉", LEGEND_UTHER, 120, 340))
      return this
    endmethod
  endstruct

endlibrary