library QuestDragonmawPort requires QuestData, TwilightSetup, QuestItemKillUnit

  struct QuestDragonmawPort extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "龙喉港已经落入了我们的掌控之中，其中的军队可以自由的支援" + this.Holder.Team.Name + "了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "控制龙喉港的所有建筑"
    endmethod

    private method GrantDragonmawPort takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in DragonmawPort
      call GroupEnumUnitsInRect(tempGroup, gg_rct_DragonmawUnlock, null)
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
      call this.GrantDragonmawPort(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantDragonmawPort(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("龙喉港", "龙喉港将会是入侵艾泽拉斯的完美集结地。", "ReplaceableTextures\\CommandButtons\\BTNIronHordeSummoningCircle.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n08T')))
      call this.AddQuestItem(QuestItemExpire.create(1227))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary