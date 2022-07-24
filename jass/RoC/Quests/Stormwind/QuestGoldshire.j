library QuestGoldshire requires QuestData, StormwindSetup

  struct QuestGoldshire extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "豺狼人被打败了，闪金镇安全了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得闪金镇所有建筑和单位"
    endmethod

    private method GrantGoldshire takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Goldshire
      call GroupEnumUnitsInRect(tempGroup, gg_rct_ElwinForestAmbient, null)
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
      call this.GrantGoldshire(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantGoldshire(this.Holder.Player)
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("埃尔文之灾", "霍格和他的手下已经占领了闪金镇，把他们清除掉！", "ReplaceableTextures\\CommandButtons\\BTNGnoll.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_n021_2624)) //Hogger
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00Z')))
      call this.AddQuestItem(QuestItemExpire.create(1335))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary