library QuestQueldanil requires QuestData, QuelthalasSetup, LegendNeutral

  globals
    private constant integer QUEST_RESEARCH_ID = 'R074'   //This research is given when the quest is completed
  endglobals

  struct QuestQueldanil extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "奎尔萨拉斯终于在辛特兰与迷失的流浪者重聚。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "奎尔丹尼的控制权"
    endmethod

    private method OnComplete takes nothing returns nothing
      local unit u
      loop
        set u = FirstOfGroup(udg_QuelDanilLodge)
        exitwhen u == null
        call UnitRescue(u, this.Holder.Player)
        call GroupRemoveUnit(udg_QuelDanilLodge, u)
      endloop
      call DestroyGroup(udg_QuelDanilLodge)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("奎尔丹尼", "奎尔达尼尔小屋是一个位于辛特兰的高等精灵前哨基地。游侠们已经有一段时间没有和奎尔萨拉斯联系了。", "ReplaceableTextures\\CommandButtons\\BTNBearDen.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_QuelDanil_Lodge, "奎尔丹尼小屋", true))
      call this.AddQuestItem(QuestItemTime.create(1320))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_SUNWELL, true))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary