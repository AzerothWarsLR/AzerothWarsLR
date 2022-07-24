library QuestShattrah requires QuestData, DalaranSetup

  struct QuestShattrah extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "信使及时到达了沙塔斯。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得沙塔斯所有建筑"
    endmethod

    private method GrantShattrah takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Shattrah
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Shattrah, null)
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
      call this.GrantShattrah(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantShattrah(this.Holder.Player)
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("警告沙塔斯", "必须警告沙塔斯兽人即将入侵", "ReplaceableTextures\\CommandButtons\\BTNCallToArms.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Shattrah, "沙塔斯", false))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary