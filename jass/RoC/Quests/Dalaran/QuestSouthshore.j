library QuestSouthshore requires QuestData, DalaranSetup

  struct QuestSouthshore extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "鱼人们已经被击败，南海镇现在安全了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得南海镇所有单位和建筑的控制权。"
    endmethod

    private method GrantSouthshore takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Southshore
      call GroupEnumUnitsInRect(tempGroup, gg_rct_SouthshoreUnlock, null)
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
      call this.GrantSouthshore(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantSouthshore(this.Holder.Player)
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("鱼人问题", "南海镇正遭到一小股鱼人们的袭击，击退它们。", "ReplaceableTextures\\CommandButtons\\BTNMurloc.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_nmrm_0204)) //Murloc
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n08M')))
      call this.AddQuestItem(QuestItemExpire.create(1135))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary