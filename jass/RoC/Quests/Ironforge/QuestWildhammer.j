library QuestWildhammer requires QuestItemKillUnit, IronforgeSetup, LegendNeutral

  globals
    private constant integer HERO_ID = 'H028'
    private constant integer RESEARCH_ID = 'R01C'
  endglobals

  struct QuestWildhammer extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "麦格尼已经与弗斯塔德·蛮锤进行了交谈并与蛮锤氏族建立了联盟"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得鹰巢山所有建筑和单位并允许在祭坛内召唤弗斯塔德·蛮锤"
    endmethod

    private method OnComplete takes nothing returns nothing
      local group tempGroup = CreateGroup()
      local unit u

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
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
      call Holder.ModObjectLimit(HERO_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("蛮锤盟友", "蛮锤矮人们自由的漫游在辛特兰的山峰之上。麦格尼亲自与他们去进行会谈的话说不定能获得他们的协助。", "ReplaceableTextures\\CommandButtons\\BTNHeroGriffonWarrior.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_MAGNI, gg_rct_Aerie_Peak, "鹰巢山"))
      return this
    endmethod
  endstruct

endlibrary