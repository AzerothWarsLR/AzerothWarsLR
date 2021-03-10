library QuestCorruptSunwell requires QuestData, ScourgeSetup

  globals
    private constant integer RESEARCH_ID = 'R04K'
  endglobals

  struct QuestCorruptSunwell extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Sunwell has been captured by the Scourge. It now writhes with necromantic energy."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Necromancers' Raise Dead summons 2 Skeletons instead of 1"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call SetUnitAnimation(LEGEND_SUNWELL.Unit, "stand second")
      call SetUnitAnimation(LEGEND_SUNWELL.Unit, "stand third")
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Fall of Silvermoon", "The Sunwell is the source of the High Elves' immortality and magical prowess. Under control of the Scourge, it would a the source of immense necromantic power.", "ReplaceableTextures\\CommandButtons\\BTNOrbOfCorruption.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_SUNWELL, false))
      return this
    endmethod
  endstruct

endlibrary