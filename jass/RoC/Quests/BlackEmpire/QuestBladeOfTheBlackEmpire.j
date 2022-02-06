
library QuestBladeOfTheBlackEmpire requires QuestData, Artifact, LegendBlackEmpire, LegendNeutral, GeneralHelpers, GlobalQuest

  struct QuestBladeOfTheBlackEmpire extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Herald Volazj has found the Black Blade, Xal'alath."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Xal'alath will be ours and the Tomb of Tyr quest will be revealed"
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitAddItemSafe(LEGEND_VOLAZJ.Unit, ARTIFACT_XALATATH.item) 
      call FACTION_BLACKEMPIRE.AddQuest(TOMB_OF_TYR)
      set TOMB_OF_TYR.Progress = QUEST_PROGRESS_INCOMPLETE
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Blade of the Black Empire", "Xal'alath is one of the oldest and most powerful entities serving the Old Gods, living inside a cursed blade. A human priestess stole it long ago; the blade is entombed with her in Duskwood Crypt.", "ReplaceableTextures\\CommandButtons\\BTNmidnightGS.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_VOLAZJ, gg_rct_DuskwoodCrypt, "Duskwood Graveyard Crypt"))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_DUSKWOODGRAVEYARD, false))
      return this
    endmethod
  endstruct

endlibrary