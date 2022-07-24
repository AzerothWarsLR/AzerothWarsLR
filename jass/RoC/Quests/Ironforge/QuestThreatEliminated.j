//When Black Temple is destroyed, Stormwind can train ThreatEliminated.
library QuestThreatEliminated requires QuestData, IronforgeSetup, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R08W'
  endglobals

  struct QuestThreatEliminated extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "With the threat of the Fel Horde now eliminated, the Dwarves are free to explore other ventures"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You can select your path in the Blacksmith"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Threat of the Fel Horde", "The Fel Horde is too big a threat to the Dwarven people to be ignored, they must be eliminated at all cost.", "ReplaceableTextures\\CommandButtons\\BTNIronHordeStrongHold.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_BLACKTEMPLE, false))
      set this.ResearchId = RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary