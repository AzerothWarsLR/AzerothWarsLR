library QuestUnlockShip requires QuestData, KultirasSetup, GeneralHelpers

  struct QuestUnlockShip extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "普罗德摩尔的旗舰现在可以启航了！"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "解除普罗德摩尔旗舰的暂停并解锁里面的建筑"
    endmethod

    private method operator FailurePopup takes nothing returns string
      return "伯拉勒斯已经被毁，凯瑟琳和少数幸存者们一起乘坐普罗德摩尔旗舰逃离。"
    endmethod

    private method operator FailureDescription takes nothing returns string
      return "你将失去你控制的所有，但在你的旗舰内获得凯瑟琳"
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_ShipAmbient, this.Holder.Player)
      call PauseUnitBJ( false, gg_unit_h05V_0260 )
      call SetUnitInvulnerable(gg_unit_h05V_0260, false)
      set FACTION_KULTIRAS.Team = TEAM_ALLIANCE
      set FACTION_TROLL.Team = TEAM_HORDE
    endmethod

    private method OnFail takes nothing returns nothing
      local unit u
      local player holderPlayer = this.Holder.Person.Player
      set LEGEND_KATHERINE.StartingXP = GetHeroXP(LEGEND_KATHERINE.Unit)
      call ReviveHero(LEGEND_KATHERINE.Unit, -15223, -22856, true)
      call ReviveHero(LEGEND_ADMIRAL.Unit, -15223, -22856, true)
      call LEGEND_KATHERINE.Spawn(this.Holder.Player, -15223, -22856, 110)
      call LEGEND_ADMIRAL.Spawn(this.Holder.Player, -15223, -22856, 110)
      call SetUnitOwner(LEGEND_KATHERINE.Unit, Player(PLAYER_NEUTRAL_PASSIVE), true)
      call SetUnitOwner(LEGEND_ADMIRAL.Unit, Player(PLAYER_NEUTRAL_PASSIVE), true)
      call this.Holder.obliterate()
      call SetUnitOwner(LEGEND_KATHERINE.Unit, this.Holder.Player, true)
      call SetUnitOwner(LEGEND_ADMIRAL.Unit, this.Holder.Player, true)
      if GetLocalPlayer() == this.Holder.Player then
        call SetCameraPosition(GetRectCenterX(gg_rct_ShipAmbient), GetRectCenterY(gg_rct_ShipAmbient))
      endif
      call RescueNeutralUnitsInRect(gg_rct_ShipAmbient, this.Holder.Player)
      call PauseUnitBJ( false, gg_unit_h05V_0260 )
      call SetUnitOwner(gg_unit_h05V_0260, this.Holder.Player, true)
      call AdjustPlayerStateBJ( 500, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
      call AdjustPlayerStateBJ( 2000, this.Holder.Player, PLAYER_STATE_RESOURCE_LUMBER )
      call SetUnitInvulnerable(gg_unit_h05V_0260, false)
      call IssuePointOrderLocBJ( gg_unit_h05V_0260, "move", GetRectCenter(gg_rct_SouthshoreUnlock) )
      set FACTION_KULTIRAS.Team = TEAM_ALLIANCE
      set FACTION_TROLL.Team = TEAM_HORDE
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("赞达拉威胁", "巨魔帝国赞达拉对库尔提拉斯和联盟的安全构成了威胁。在启航之前我们必须消灭他们。", "ReplaceableTextures\\CommandButtons\\BTNGalleonIcon.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_DAZARALOR, false))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_BORALUS, true))
      return this
    endmethod
  endstruct

endlibrary