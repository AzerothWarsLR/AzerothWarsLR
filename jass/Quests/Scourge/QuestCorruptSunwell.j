library QuestCorruptSunwell requires QuestData, LegionConfig

  globals
    private constant integer RESEARCH_ID = 'R04K'
    private constant integer DARKFALLEN_ID = 'h04A'
  endglobals

  struct QuestCorruptSunwell extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Sunwell has been captured by the Scourge. It now writhes with necromantic energy."
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetUnitAnimation(LEGEND_SUNWELL.Unit, "stand second")
      call SetUnitAnimation(LEGEND_SUNWELL.Unit, "stand third")
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(this.Holder.Player, DARKFALLEN_ID, "You can now train " + GetObjectName(DARKFALLEN_ID) + " from the Temple of the Damned.")
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
      call this.Holder.modObjectLimit(DARKFALLEN_ID, UNLIMITED)
    endmethod

    private static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Fall of Silvermoon", "The Sunwell is the source of the High Elves' immortality and magical prowess. Under control of the Scourge, it would be the source of immense necromantic power.", "ReplaceableTextures\\CommandButtons\\BTNOrbOfCorruption.blp")
      call this.AddQuestItem(QuestItemCaptureLegend.create(LEGEND_SUNWELL))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_SCOURGE.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary