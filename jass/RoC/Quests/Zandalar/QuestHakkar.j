//Anyone on the Night Elves team approaches Moonglade with a unit with the Horn of Cenarius,
//Causing Malfurion to spawn.
library QuestHakkar requires TrollSetup, LegendTroll


  struct QuestHakkar extends QuestData
    
    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "哈卡从沉没神庙内现身了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得半神哈卡"
    endmethod

    private method OnComplete takes nothing returns nothing
      call LEGEND_HAKKAR.Spawn(Holder.Player, GetRectCenterX(gg_rct_DrownedTemple), GetRectCenterY(gg_rct_DrownedTemple), 270)
      call SetHeroLevel(LEGEND_HAKKAR.Unit, 12, false)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("夺灵者之缚", "哈卡是巨魔洛阿中最危险、最强大的。只有通过将恶魔之魂融合之后赞达拉才能控制并束缚祂。", "ReplaceableTextures\\CommandButtons\\BTNWindSerpent2.blp")
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_ZINROKH))
      call this.AddQuestItem(QuestItemArtifactInRect.create(ARTIFACT_ZINROKH, gg_rct_DrownedTemple, "沉没神庙"))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00U')))
      return this
    endmethod
  endstruct

endlibrary