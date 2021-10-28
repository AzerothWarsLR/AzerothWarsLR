library QuestNaxxramas requires QuestData, QuestItemKillUnit

  struct QuestNaxxramas extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Naxxramas has now been raised and under the control of the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Naxxramas"
    endmethod

    private method GrantNaxxramas takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Naxxramas
      call GroupEnumUnitsInRect(tempGroup, gg_rct_NaxAmbient, null)
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

    private method OnComplete takes nothing returns nothing
      call this.GrantNaxxramas(this.Holder.Player)
      call SetUnitOwner( gg_unit_e013_1815, this.Holder.Player, true )
      call SetUnitInvulnerable( gg_unit_e013_1815, false )
      call SetPlayerAbilityAvailableBJ( false, 'A0O2', this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Dread Citadel", "This fallen necropolis can be transformed into a potent war machine by the Lich Kel'tuzad", "ReplaceableTextures\\CommandButtons\\BTNBlackCitadel.blp")
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_KELTHUZAD, gg_rct_NaxUnlock, "Naxxramas"))
      call this.AddQuestItem(QuestItemCastSpell.create('A0O2', true))
      return this
    endmethod
  endstruct

endlibrary