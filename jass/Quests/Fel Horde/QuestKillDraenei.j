library QuestKillDraenei requires QuestData

  struct QuestKillDraenei extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Draenei have been eliminated from Outland and their gold mine is ours."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The Draenei rich gold mine in Tempest Keep, the faster we destroy them, the more gold will be left"
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
      local thistype this = thistype.allocate("The Shattrah Massacre", "The Draenei race existence insults the Fel Horde demon masters, slaughter them all ", "ReplaceableTextures\\CommandButtons\\BTNChaosWolfRider.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n09X')))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_EXODARSHIP))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_SHATTRAH))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_HALAAR))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FARAHLON))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TELREDOR))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary