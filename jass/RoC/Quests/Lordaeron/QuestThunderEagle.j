library QuestThunderEagle requires QuestData, QuestItemControlPoint, LordaeronSetup, LegendLegion

  globals
    private constant integer RESEARCH_ID = 'R04L'
    private constant integer THUNDER_EAGLE_ID = 'nwe2'
  endglobals

  struct QuestThunderEagle extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "现在" + this.Holder.Name + "获得了雷鹰."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "解锁" + GetObjectName(THUNDER_EAGLE_ID) + "。"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(this.Holder.Player, THUNDER_EAGLE_ID, "现在可以从升级后后的市政厅和首都训练雷鹰单位")
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("直冲云霄！", "风暴峭壁上的雷鹰们生活在对军团的恐惧之中。消灭军团枢纽来让这些雷鹰们自由。", "ReplaceableTextures\\CommandButtons\\BTNWarEagle.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_DRAKTHARONKEEP, false))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n02S')))
      return this
    endmethod
  endstruct

endlibrary