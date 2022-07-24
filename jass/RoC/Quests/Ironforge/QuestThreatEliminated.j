//When Black Temple is destroyed, Stormwind can train ThreatEliminated.
library QuestThreatEliminated requires QuestData, IronforgeSetup, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R08W'
  endglobals

  struct QuestThreatEliminated extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "随着邪部落的威胁被清除，矮人现在可以自由开启其他的冒险了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "你可以在铁匠铺内选择你的道路了。"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("邪部落的威胁", "邪部落对矮人的威胁已经大到不能忽视了，必须不惜一切代价的消灭他。", "ReplaceableTextures\\CommandButtons\\BTNIronHordeStrongHold.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_BLACKTEMPLE, false))
      set this.ResearchId = RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary