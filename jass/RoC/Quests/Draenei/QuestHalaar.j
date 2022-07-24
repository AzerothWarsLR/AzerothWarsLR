library QuestHalaar requires QuestData, DalaranSetup

  struct QuestHalaar extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "信使及时到达了哈拉尔。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得哈拉尔所有建筑"
    endmethod

    private method GrantHalaar takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Halaar
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Halaar, null)
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
      call this.GrantHalaar(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantHalaar(this.Holder.Player)
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("警告哈拉尔", "必须警告哈拉尔兽人即将入侵", "ReplaceableTextures\\CommandButtons\\BTNCallToArms.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Halaar, "哈拉尔", false))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary