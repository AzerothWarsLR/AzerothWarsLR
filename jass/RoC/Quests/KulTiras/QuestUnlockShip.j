library QuestUnlockShip requires QuestData, KultirasSetup, GeneralHelpers

  struct QuestUnlockShip extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Proudmoore capital ship is now ready to set sails!"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Unpause the Proudmoore capital ship and unlocks the buildings inside."
    endmethod

    private method operator FailurePopup takes nothing returns string
      return "Boralus has fallen, Katherine has escaped on the Proudmoore Capital Ship with a handful of Survivors."
    endmethod

    private method operator FailureDescription takes nothing returns string
      return "You lose everything you control, but you gain Katherine at the capital ship."
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
      local thistype this = thistype.allocate("The Zandalar Menace", "The Troll Empire of Zandalar is a danger to the safety of Kul'tiras and the Alliance. Before setting sail, we must eliminate them.", "ReplaceableTextures\\CommandButtons\\BTNGalleonIcon.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_DAZARALOR, false))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_BORALUS, true))
      return this
    endmethod
  endstruct

endlibrary