library QuestHellfire requires QuestData, IronforgeSetup, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R00P'
  endglobals

  struct QuestHellfire extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "地狱火堡垒已经被征服，其军队现在可以自由协助" + this.Holder.Team.Name + "。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得地狱火堡垒中所有单位和建筑并允许在祭坛内召唤卡加斯"
    endmethod

    private method GrantHellfire takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Hellfire Citadel
      call GroupEnumUnitsInRect(tempGroup, gg_rct_HellfireUnlock, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_AGGRESSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnitRescue(gg_unit_n081_0882, FACTION_FEL_HORDE.Player)
      call UnitRescue(gg_unit_n081_0717, FACTION_FEL_HORDE.Player)
      call SetPlayerTechResearched(Holder.Player, 'R00P', 1) 
      call this.GrantHellfire(this.Holder.Player)
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\FelTheme.mp3" )
      endif
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantHellfire(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("堡垒", "地狱火堡垒内的氏族并不尊重卡加斯的地位，干掉摩摩尔来将玛瑟里顿确立为无可争议的外域之王", "ReplaceableTextures\\CommandButtons\\BTNFelOrcFortress.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_EXODARSHIP))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01J')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n02N')))
      call this.AddQuestItem(QuestItemUpgrade.create('o030', 'o02Y'))
      call this.AddQuestItem(QuestItemExpire.create(1450))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary