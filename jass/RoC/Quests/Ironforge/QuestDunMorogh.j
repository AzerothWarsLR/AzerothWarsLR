library QuestDunMorogh requires QuestData, ScarletSetup

  struct QuestDunMorogh extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "巨魔们被打败了，丹莫罗将加入你的事业"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得丹莫罗所有建筑和单位"
    endmethod

    private method GrantDunMorogh takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in DunMorogh
      call GroupEnumUnitsInRect(tempGroup, gg_rct_DunmoroghAmbient2, null)
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
      call this.GrantDunMorogh(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantDunMorogh(this.Holder.Player)
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("山中之村", "一小股巨魔正在袭击丹莫罗，击败他们。", "ReplaceableTextures\\CommandButtons\\BTNIceTrollShadowPriest.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_nith_1625)) //Troll
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n014')))
      call this.AddQuestItem(QuestItemExpire.create(1435))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary