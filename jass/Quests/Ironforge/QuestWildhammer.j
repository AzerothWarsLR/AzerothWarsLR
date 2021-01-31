library QuestWildhammer initializer OnInit requires QuestItemKillUnit, IronforgeConfig, LegendNeutral

  struct QuestWildhammer extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Magni has spoken with Falstad Wildhammer and secured an alliance with the Wildhammer Clan."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You gain control of Aerie Peak and the hero Falstad Wildhammer"
    endmethod

    private method OnComplete takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      call LEGEND_FALSTAD.Spawn(this.Holder.Player, 14081, 4580, 35)
      call UnitDetermineLevel(LEGEND_FALSTAD.Unit, 1.00)

      //Remove pathing blockers obstructing Aerie Peak
      call RemoveDestructable( gg_dest_YTpc_7559 )
      call RemoveDestructable( gg_dest_YTpc_2065 )
      call RemoveDestructable( gg_dest_YTpc_2067 )
      call RemoveDestructable( gg_dest_YTpc_12037 )

      //Transfer all Neutral Passive units in region to Ironforge
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Aerie_Peak, null)
      
      loop
        set u = FirstOfGroup(tempGroup)
        exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, this.Holder.Player)
        endif
        call GroupRemoveUnit(tempGroup, u)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Wildhammer Alliance", "The Wildhammer dwarves roam freely over the peaks of the Hinterlands. An audience with Magni himself might earn their cooperation.", "ReplaceableTextures\\CommandButtons\\BTNHeroGriffonWarrior.blp")
      call this.AddQuestItem(QuestItemLegendLevel.create(LEGEND_MAGNI, 8))
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_MAGNI, gg_rct_Aerie_Peak, "Aerie Peak"))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_IRONFORGE.AddQuest(QuestWildhammer.create())
  endfunction

endlibrary