//Anyone on the Night Elves team approaches Moonglade with a unit with the Horn of Cenarius,
//Causing Malfurion to spawn.
library QuestMalfurionAwakens initializer OnInit requires DruidsConfig, LegendDruids, Display

  globals
    private constant integer HORN_OF_CENARIUS = 'cnhn'
    private constant integer GHANIR = 'I00C'
  endglobals

  struct QuestMalfurionAwakens extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Malfurion has emerged from his deep slumber in the Barrow Den."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain the hero Malfurion and the artifact G'hanir"
    endmethod

    private method OnComplete takes nothing returns nothing
      if LEGEND_MALFURION.Unit == null then
        call LEGEND_MALFURION.Spawn(Holder.Player, GetRectCenterX(gg_rct_Moonglade), GetRectCenterY(gg_rct_Moonglade), 270)
        call SetHeroLevel(LEGEND_MALFURION.Unit, 3, false)
        call UnitAddItem(LEGEND_MALFURION.Unit, ARTIFACT_GHANIR.item)
      else
        call SetItemPosition(ARTIFACT_GHANIR.item, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
      endif
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Awakening of Stormrage", "Ever since the War of the Ancients ten thousand years ago, Malfurion Stormrage and his druids have slumbered within the Barrow Den. Now, their help is required once again.", "ReplaceableTextures\\CommandButtons\\BTNFurion.blp")
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_GHANIR))
      call this.AddQuestItem(QuestItemArtifactInRect.create(ARTIFACT_GHANIR, gg_rct_Moonglade))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_DRUIDS.AddQuest(QuestMalfurionAwakens.create())
  endfunction

endlibrary