library QuestAshenvale requires QuestData, DruidsSetup

  globals
    private constant integer QUESTRESEARCH_ID = 'R06R'   //This research is given when the quest is completed
  endglobals

  struct QuestAshenvale extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "灰谷在你的控制之下，森林也被唤醒了"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得灰谷所有单位并召唤战歌伐木营周围的所有树苗"
    endmethod

    private method GrantAshenvale takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Ashenvale
      call GroupEnumUnitsInRect(tempGroup, gg_rct_AshenvaleUnlock, null)
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
      call this.GrantAshenvale(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call TriggerExecute( gg_trg_AshenvaleUnleashed)
      
      call this.GrantAshenvale(this.Holder.Player)
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\DruidTheme.mp3" )
      endif

    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("灰谷之魂", "这片森林需要治疗。夺回森林的控制权并将它的愤怒释放给部落", "ReplaceableTextures\\CommandButtons\\BTNKeeperC.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_MALFURION, gg_rct_AshenvaleUnlock, "灰谷"))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n07C')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01Q')))
      call this.AddQuestItem(QuestItemResearch.create('R091', 'n002'))
      call this.AddQuestItem(QuestItemUpgrade.create('etoe', 'etol'))
      call this.AddQuestItem(QuestItemExpire.create(1440))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUESTRESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary