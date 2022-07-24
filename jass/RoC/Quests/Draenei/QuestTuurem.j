library QuestTuurem requires QuestData, DalaranSetup

  struct QuestTuurem extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "信使及时到达了图雷姆"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得图雷姆所有建筑"
    endmethod

    private method GrantTuurem takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Tuurem
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Tuurem, null)
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
      call this.GrantTuurem(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantTuurem(this.Holder.Player)
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("警告图雷姆", "必须警告图雷姆兽人即将入侵", "ReplaceableTextures\\CommandButtons\\BTNCallToArms.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Tuurem, "图雷姆", false))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary