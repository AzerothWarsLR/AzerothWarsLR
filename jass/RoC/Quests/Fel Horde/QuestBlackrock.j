library QuestBlackrock requires QuestData, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R03C'
  endglobals

  struct QuestBlackrock extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "黑石堡垒已经臣服于你，它的军队现在可以自由的协助" + this.Holder.Team.Name + "。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得黑石堡垒内所有单位和建筑，并解锁祭坛内的雷德·黑手"
    endmethod

    private method GrantBlackrock takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Blackrock
      call GroupEnumUnitsInRect(tempGroup, gg_rct_BlackrockUnlock, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantBlackrock(Player(PLAYER_NEUTRAL_AGGRESSIVE))

      call WaygateActivateBJ( true, gg_unit_h03V_0220 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0220, GetRectCenter(gg_rct_BlackrockExit2) )

      call WaygateActivateBJ( true, gg_unit_n033_0108 )
      call WaygateSetDestinationLocBJ( gg_unit_n033_0108, GetRectCenter(gg_rct_BlackrockExit1) )
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, 'R03C', 1) 
      call this.GrantBlackrock(this.Holder.Player)

      call WaygateActivateBJ( true, gg_unit_h03V_0220 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0220, GetRectCenter(gg_rct_BlackrockExit2) )

      call WaygateActivateBJ( true, gg_unit_n033_0108 )
      call WaygateSetDestinationLocBJ( gg_unit_n033_0108, GetRectCenter(gg_rct_BlackrockExit1) )
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("统一黑石", "联系黑石氏族并说服他们加入玛瑟里顿", "ReplaceableTextures\\CommandButtons\\BTNBlackhand.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_EXODARSHIP))
      call this.AddQuestItem(QuestItemEitherOf.create(QuestItemResearch.create('R090', 'o00F'), QuestItemTime.create(960)))
      call this.AddQuestItem(QuestItemExpire.create(1451))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary