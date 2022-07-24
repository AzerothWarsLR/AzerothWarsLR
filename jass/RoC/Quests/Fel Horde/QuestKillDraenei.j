library QuestKillDraenei requires QuestData

  struct QuestKillDraenei extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "外域内的德莱尼已经被消灭了，他们的金矿现在是我们的了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "我们越快消灭德莱尼，风暴要塞中德莱尼留下的矿就有越多黄金"
    endmethod

    private method OnComplete takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      call AdjustPlayerStateBJ( 500, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call AdjustPlayerStateBJ( 500, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
      call GroupEnumUnitsInRect(tempGroup, gg_rct_InstanceOutland, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == FACTION_DRAENEI.Player then
          if IsUnitType(u, UNIT_TYPE_STRUCTURE) and not IsUnitType(u, UNIT_TYPE_ANCIENT) then
            call KillUnit(u)
          endif
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null 
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("沙塔斯大屠杀", "德莱尼种族的存在侮辱了邪兽人的恶魔主人，杀光他们!", "ReplaceableTextures\\CommandButtons\\BTNChaosWolfRider.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09X')))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_EXODARSHIP))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_SHATTRAH))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TUUREM))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_HALAAR))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FARAHLON))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TELREDOR))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary