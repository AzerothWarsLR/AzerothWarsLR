library QuestStonemaul requires QuestData, WarsongSetup, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R03S'   //This research is given when the quest is completed
  endglobals

  struct QuestStonemaul extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "石锤堡垒已经被解放而它的军队将可以自由的协作" + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得石锤堡垒内所以单位和建筑的控制权和3000木头。"
    endmethod

    private method GrantStonemaul takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Stonemaul
      call GroupEnumUnitsInRect(tempGroup, gg_rct_StonemaulKeep, null)
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
      call this.GrantStonemaul(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantStonemaul(this.Holder.Player)
      call AdjustPlayerStateBJ(3000, FACTION_FROSTWOLF.Player, PLAYER_STATE_RESOURCE_LUMBER)
      call AdjustPlayerStateBJ( 300, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("大酋长的挑战", "石锤食人魔们只会跟随强者，杀死食人魔酋长以获得基地的控制权。", "ReplaceableTextures\\CommandButtons\\BTNOneHeadedOgre.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_KORGALL))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n022')))
      call this.AddQuestItem(QuestItemExpire.create(1505))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary