library QuestDarkIron requires QuestItemKillUnit, IronforgeSetup, LegendNeutral

  globals
    private constant integer HERO_ID = 'H03G'
    private constant integer RESEARCH_ID = 'R01A'
  endglobals

  struct QuestDarkIron extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "和平会谈成功了，黑铁矮人将会加入矮人帝国"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得影炉堡的控制并允许在坚韧祭坛内召唤达格兰·索瑞森"
    endmethod

    private method OnComplete takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local unit u          
      //Transfer all Neutral Passive units in region to Ironforge
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Shadowforge_City, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, this.Holder.Player)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
      call Holder.ModObjectLimit(HERO_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("黑铁盟友", "黑铁矮人们是叛徒，把麦格尼带到他们的首都来进行和平谈判。", "ReplaceableTextures\\CommandButtons\\BTNRPGDarkIron.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_MAGNI, gg_rct_Shadowforge_gate, "影炉堡"))
      call this.AddQuestItem(QuestItemResearch.create('R08U', 'h048'))
      return this
    endmethod
  endstruct

endlibrary