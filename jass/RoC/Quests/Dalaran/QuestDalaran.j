library QuestDalaran requires QuestData, LordaeronSetup, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R038'
  endglobals

  struct QuestDalaran extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "达拉然郊区现在安全了，法师们将加入" + this.Holder.Team.Name + "。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得达拉然内所有单位和建筑的控制权，并允许在祭坛内召唤安东尼达斯。"
    endmethod

    private method GrantDalaran takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Dalaran
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Dalaran, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call GroupEnumUnitsInRect(tempGroup, gg_rct_DalaranDungeon, null)      
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
      call this.GrantDalaran(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, 'R038', 1) 
      call this.GrantDalaran(this.Holder.Player)
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\DalaranTheme.mp3" )
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("郊区", "达拉然的领土支离破碎，夺回失去的领土并保护达拉然的人民。", "ReplaceableTextures\\CommandButtons\\BTNArcaneCastle.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01D')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n08M')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n018')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01I')))
      call this.AddQuestItem(QuestItemUpgrade.create('h068', 'h065'))
      call this.AddQuestItem(QuestItemExpire.create(1445))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary