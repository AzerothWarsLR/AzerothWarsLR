library QuestZulfarrak initializer OnInit requires WarsongConfig, LegendNeutral

  struct QuestZulfarrak extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Zul'farrak has fallen. The Sandfury trolls lend their might to the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of Zul'farrak and an army of Sandfury trolls"
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
      call CreateUnits(this.Holder.Player, 'ndtb', GetRectCenterX(gg_rct_Zulfarrak), GetRectCenterY(gg_rct_Zulfarrak), 302, 8)
      call CreateUnits(this.Holder.Player, 'ndtp', GetRectCenterX(gg_rct_Zulfarrak), GetRectCenterY(gg_rct_Zulfarrak), 302, 4)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Fury of the Sands", "The Sandfury Trolls of Zul'farrak are openly hostile to visitors, but they share a common heritage with the Darkspear Trolls. An adequate display of force could bring them around.", "ReplaceableTextures\\CommandButtons\\BTNDarkTroll.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ZULFARRAK, false))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_WARSONG.AddQuest(QuestZulfarrak.create())
  endfunction

endlibrary