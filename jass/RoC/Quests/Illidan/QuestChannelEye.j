library QuestChannelEye requires Persons, NagaSetup, GeneralHelpers

  struct QuestChannelEye extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "Illidan has destroyed the Frozen Throne and given by Kil'jaeden his just reward"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Destroying the Frozen Throne will eliminate the Scourge faction and make Illidan level 20 instantly."
    endmethod    

    private method OnComplete takes nothing returns nothing

      call FACTION_SCOURGE.obliterate()
      call KillUnit( LEGEND_LICHKING.Unit)
      call SetHeroLevel(LEGEND_ILLIDAN.Unit, 20, false)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Ruins of Dalaran", "Illidan has been tasked by Kil'jaeden to destroy the Frozen Throne.", "ReplaceableTextures\\CommandButtons\\BTNTheLichKingQuest.blp")
      call this.AddQuestItem(QuestItemArtifactInRect.create(ARTIFACT_EYEOFSARGERAS, gg_rct_RuinOfDalaran, "Ruins of Dalaran"))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_DALARAN))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_CAPITALPALACE))
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_RuinOfDalaran, "Ruins of Dalaran", LEGEND_ILLIDAN, 360, 90))
      call this.AddQuestItem(QuestItemResearch.create('R063', 'n055'))
      return this
    endmethod
  endstruct

endlibrary