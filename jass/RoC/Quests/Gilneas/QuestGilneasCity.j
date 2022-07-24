library QuestGilneasCity requires QuestData

  globals
    private constant integer RESEARCH_ID = 'R02R'
  endglobals

  struct QuestGilneasCity extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "所有的狼人都被杀掉了，诅咒被解除了！"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得格雷迈恩之墙和吉尔尼斯城的控制权。"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock5, Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock6, Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call RemoveUnit(gg_unit_o05Q_2212)
      call RemoveUnit(gg_unit_o05Q_2234)
    endmethod

    private method OnComplete takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock5, this.Holder.Player)
      call RescueNeutralUnitsInRect(gg_rct_GilneasUnlock6, this.Holder.Player)
      call SetUnitInvulnerable(gg_unit_o05Q_2234, true)
      call SetUnitInvulnerable(gg_unit_o05Q_2212, true)
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\GilneasTheme1.mp3" )
      endif
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("吉尔尼斯的解放", "吉尔尼斯一直被狼人诅咒所困扰。消灭所有狼人来解除吉尔尼斯的诅咒。", "ReplaceableTextures\\CommandButtons\\BTNGilneasCathedral.blp")
      call this.AddQuestItem(QuestItemKillXUnit.create('o02J', 11))
      call this.AddQuestItem(QuestItemKillXUnit.create('O038', 4))
      call this.AddQuestItem(QuestItemUpgrade.create('h02C', 'h01R'))
      call this.AddQuestItem(QuestItemExpire.create(1380))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary