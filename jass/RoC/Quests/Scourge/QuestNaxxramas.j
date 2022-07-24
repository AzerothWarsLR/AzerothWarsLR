library QuestNaxxramas requires QuestData, QuestItemChannelRect, LegendScourge

  struct QuestNaxxramas extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Naxxramas has now been raised and under the control of the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Naxxramas"
    endmethod

    private method GrantNaxxramas takes player whichPlayer returns nothing
      local unit u
      loop
        set u = FirstOfGroup(udg_HiddenUnits5)
        exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
          call ShowUnitShow(u)
          endif
          call GroupRemoveUnit(udg_HiddenUnits5, u)
      endloop
      call DestroyGroup(udg_HiddenUnits5)
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantNaxxramas(this.Holder.Player)
      call SetUnitOwner( gg_unit_e013_1815, this.Holder.Player, true )
      call SetUnitInvulnerable( gg_unit_e013_1815, false )
      call SetPlayerAbilityAvailableBJ( false, 'A0O2', this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Dread Citadel", "This fallen necropolis can be transformed into a potent war machine by the Lich Kel'tuzad", "ReplaceableTextures\\CommandButtons\\BTNBlackCitadel.blp")
      local QuestItemChannelRect questItemChannelRect = this.AddQuestItem(QuestItemChannelRect.create(gg_rct_NaxUnlock, "Naxxramas", LEGEND_KELTHUZAD, 60, 270))
      set questItemChannelRect.RequiredUnitTypeId = UNITTYPE_KELTHUZAD_LICH
      return this
    endmethod
  endstruct

endlibrary