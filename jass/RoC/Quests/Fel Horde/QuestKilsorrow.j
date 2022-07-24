library QuestKilsorrow requires QuestData

  struct QuestKilsorrow extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "基尔索罗现已建立，其军队现在可以自由协助" + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得基尔索罗要塞，黑暗神殿和3个新恶魔之门。埃索达不再是无敌的了。"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_KilsorrowUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call ShowUnitShow(gg_unit_ngol_3386)
      call RescueNeutralUnitsInRect(gg_rct_KilsorrowUnlock, this.Holder.Player)
      call UnitRescue(gg_unit_n081_4142, FACTION_FEL_HORDE.Player)
      call UnitRescue(LEGEND_BLACKTEMPLE.Unit, this.Holder.Player)
      call LEGEND_MAGTHERIDON.AddUnitDependency(gg_unit_o00F_0659)
      call SetUnitInvulnerable(gg_unit_h09W_3303, false)
      set LEGEND_MAGTHERIDON.DeathMessage = "玛瑟里顿的永恒恶魔之魂已经被吞噬，他将将永远的死去。外域之主已经陨落。"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("基尔索罗要塞", "这座邪恶的要塞将会很好的服务于邪部落，将周围的领土清理干净来建立它", "ReplaceableTextures\\CommandButtons\\BTNFelOrcWatchTower.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_SHATTRAH))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TUUREM))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_HALAAR))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FARAHLON))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TELREDOR))
      call this.AddQuestItem(QuestItemExpire.create(1452))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary