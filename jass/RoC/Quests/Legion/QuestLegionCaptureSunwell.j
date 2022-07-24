library QuestLegionCaptureSunwell requires QuestData, LegionSetup, LegendQuelthalas

  globals
    private constant integer RESEARCH_ID = 'R054'
  endglobals

  struct QuestLegionCaptureSunwell extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "太阳井已经被天灾军团占领，它现在充斥着死灵能量。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "一项增强恐惧魔王的研究"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call DisplayResearchAcquired(this.Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("银月城陷落", "太阳井是高等精灵永生和魔法力量的源泉。在天灾军团的控制下，它将会成为巨大的死灵力量的源泉。", "ReplaceableTextures\\CommandButtons\\BTNOrbOfCorruption.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_SUNWELL, false))
      return this
    endmethod
  endstruct

endlibrary