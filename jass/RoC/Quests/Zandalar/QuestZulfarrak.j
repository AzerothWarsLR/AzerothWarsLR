library QuestZulfarrak requires LegendNeutral

  globals
    private constant integer GAHZRILLA_RESEARCH = 'R02F'
    private constant integer GAHZRILLA_ID = 'H06Q'
  endglobals

  struct QuestZulfarrak extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "祖尔法拉克沦陷了。沙怒巨魔把他们的力量借给了" + this.Holder.Team.Name + ", 你可以训练风暴龙并唤醒加兹瑞拉了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得祖尔法拉，300黄金，可以训练风暴龙，并可以在征服者祭坛内召唤英雄加兹瑞拉"
    endmethod

    private method OnComplete takes nothing returns nothing
      local unit u
      local group tempGroup
      set tempGroup = CreateGroup()
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Zulfarrak, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) or GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_AGGRESSIVE) then
          if IsUnitType(u, UNIT_TYPE_HERO) == true then
            call KillUnit(u)
          else
            call UnitRescue(u, this.Holder.Player)
          endif
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop   
      call DestroyGroup(tempGroup)
      call SetPlayerTechResearched(Holder.Player, GAHZRILLA_RESEARCH, 1)
      call AdjustPlayerStateBJ( 300, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call SetUnitOwner(LEGEND_ZULFARRAK.Unit, this.Holder.Player, true)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(GAHZRILLA_RESEARCH, UNLIMITED)
      call this.Holder.ModObjectLimit(GAHZRILLA_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("沙之愤怒", "祖尔法拉克的沙怒巨魔敌视所有人，但他们与赞达拉里巨魔有着共同的传统。适当地展示武力可以使他们改变主意。", "ReplaceableTextures\\CommandButtons\\BTNDarkTroll.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ZULFARRAK, false))
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_PRIEST, gg_rct_Zulfarrak, "祖尔法拉克"))
      return this
    endmethod
  endstruct

endlibrary