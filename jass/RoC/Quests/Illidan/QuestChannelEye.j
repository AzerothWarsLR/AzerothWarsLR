library QuestChannelEye requires Persons, NagaSetup, GeneralHelpers

  struct QuestChannelEye extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "伊利丹摧毁了冰封王座，基尔加丹给予了他应得的奖励"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "摧毁冰封王座将会抹除天灾军团势力并使伊利丹立即升到20级"
    endmethod    

    private method OnComplete takes nothing returns nothing

      call FACTION_SCOURGE.obliterate()
      call KillUnit( LEGEND_LICHKING.Unit)
      call SetHeroLevel(LEGEND_ILLIDAN.Unit, 20, false)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("达拉然废墟", "伊利丹被基尔加丹派去摧毁冰封王座", "ReplaceableTextures\\CommandButtons\\BTNTheLichKingQuest.blp")
      call this.AddQuestItem(QuestItemArtifactInRect.create(ARTIFACT_EYEOFSARGERAS, gg_rct_RuinOfDalaran, "Ruins of Dalaran"))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_DALARAN))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_CAPITALPALACE))
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_RuinOfDalaran, "达拉然废墟", LEGEND_ILLIDAN, 360, 90))
      call this.AddQuestItem(QuestItemResearch.create('R063', 'n055'))
      return this
    endmethod
  endstruct

endlibrary