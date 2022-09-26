library QuestEmbassy requires QuestData, LegionSetup

  globals
    private constant integer HERO_ID = 'U00L'
    private constant integer ALTAR_ID = 'u01N'
  endglobals

  struct QuestEmbassy extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "We have eradicated the Draenei from Outland"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You can build the Infernal Machine Factory and summon Anetheron from the " + GetObjectName(ALTAR_ID)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Genocide of the Draenei", "The Draenei race existence insults the Eredar overlords of the Burning Legion, destroy them all", "ReplaceableTextures\\CommandButtons\\BTNEredarRed.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_EXODARSHIP))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TELREDOR))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FARAHLON))
      set this.ResearchId = 'R042'
      return this
    endmethod
  endstruct

endlibrary