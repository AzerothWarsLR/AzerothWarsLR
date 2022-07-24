library QuestTelredor requires QuestData, DalaranSetup

  struct QuestTelredor extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "信使及时到达了泰雷多尔"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得泰雷多尔所有建筑"
    endmethod

    private method GrantTelredor takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Telredor
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Telredor, null)
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
      call this.GrantTelredor(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantTelredor(this.Holder.Player)
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("警告泰雷多尔", "必须警告泰雷多尔兽人即将入侵", "ReplaceableTextures\\CommandButtons\\BTNCallToArms.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Telredor, "泰雷多尔", false))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary