library QuestFarahlon requires QuestData, DalaranSetup

  struct QuestFarahlon extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "信使及时到达了法兰伦。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得法兰伦所有建筑"
    endmethod

    private method GrantFarahlon takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Farahlon
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Farahlon, null)
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
      call this.GrantFarahlon(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantFarahlon(this.Holder.Player)
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("警告法兰伦", "必须警告法兰伦兽人即将入侵。", "ReplaceableTextures\\CommandButtons\\BTNCallToArms.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Farahlon, "法兰伦", false))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary