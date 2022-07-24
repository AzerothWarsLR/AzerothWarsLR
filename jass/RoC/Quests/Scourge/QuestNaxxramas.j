library QuestNaxxramas requires QuestData, QuestItemChannelRect, LegendScourge

  struct QuestNaxxramas extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "纳克萨玛斯现在已经升起，并在" + this.Holder.Team.Name + "控制之下。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得纳克萨马斯所有单位和建筑"
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
      local thistype this = thistype.allocate("恐怖堡垒", "这个堕落浮空城可以被巫妖克尔苏加德改造成一台强大的战争机器", "ReplaceableTextures\\CommandButtons\\BTNBlackCitadel.blp")
      local QuestItemChannelRect questItemChannelRect = this.AddQuestItem(QuestItemChannelRect.create(gg_rct_NaxUnlock, "纳克萨玛斯", LEGEND_KELTHUZAD, 60, 270))
      set questItemChannelRect.RequiredUnitTypeId = UNITTYPE_KELTHUZAD_LICH
      return this
    endmethod
  endstruct

endlibrary