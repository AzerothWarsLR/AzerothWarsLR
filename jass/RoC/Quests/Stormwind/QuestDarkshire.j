library QuestDarkshire requires QuestData, StormwindSetup, QuestItemKillUnit

  struct QuestDarkshire extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "夜色镇已经被解放，它的军队现在可以自由地协助" + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得夜色镇所有建筑和单位"
    endmethod

    private method GrantDarkshire takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Darkshire
      call GroupEnumUnitsInRect(tempGroup, gg_rct_DarkshireUnlock, null)
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
      call this.GrantDarkshire(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantDarkshire(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("豺狼人问题", "夜色镇正遭到豺狼人的袭击，把他们赶走！", "ReplaceableTextures\\CommandButtons\\BTNGnollArcher.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_ngnv_0586)) //Gnoll Overseer
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00V')))
      call this.AddQuestItem(QuestItemExpire.create(1425))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary