library QuestKilsorrow requires QuestData

  struct QuestKilsorrow extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Kil'sorrow is now established, The Black Temple and its military is now free to assist the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Kil'sorrow, The Black Temple and 3 new Demon Gates. The Exodar will be made vulnerable."
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
      set LEGEND_MAGTHERIDON.DeathMessage = "Magtheridon’s eternal demon soul has been consumed, and his life permanently extinguished. The Lord of Outland has fallen."
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Kil'sorrow Fortress", "This sinister fortress will serve the Fel Horde well, clear the surrounding lands to establish it", "ReplaceableTextures\\CommandButtons\\BTNFelOrcWatchTower.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_SHATTRAH))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_HALAAR))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_FARAHLON))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_TELREDOR))
      call this.AddQuestItem(QuestItemExpire.create(1452))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary