library QuestCrystalGolem requires QuestItemControlPoint, LegendLegion, Display

  globals
    private constant integer RESEARCH_ID = 'R045'
  endglobals

  struct QuestCrystalGolem extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return this.Holder.Name + "的大地魔像们被注入了活水晶。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "将你的土魔像转化为水晶魔像。"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
      call DisplayResearchAcquired(Holder.Player, RESEARCH_ID, 1)
      call Holder.ModObjectLimit('n096', -6)
      call Holder.ModObjectLimit('n0AD', 6)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("晶歌森林", "晶歌森林的活水晶被临近的军团所折磨。将它们从腐化中解放出来，它们可以用来增强达拉然的构装体。", "ReplaceableTextures\\CommandButtons\\BTNRockGolem.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n02R')))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_DRAKTHARONKEEP, false))
      return this
    endmethod
  endstruct

endlibrary