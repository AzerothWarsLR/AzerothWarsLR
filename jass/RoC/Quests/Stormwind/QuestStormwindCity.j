library QuestStormwindCity requires QuestData, IronforgeSetup, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R02S'
  endglobals

  struct QuestStormwindCity extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "暴风城已经被解放，其军队现在可以自由协助" + this.Holder.Team.Name + "。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得暴风城内所有单位和建筑并允许在祭坛内召唤瓦里安"
    endmethod

    private method GrantStormwind takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Stormwind
      call GroupEnumUnitsInRect(tempGroup, gg_rct_StormwindUnlock, null)
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
      call this.GrantStormwind(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, 'R02S', 1) 
      call this.GrantStormwind(this.Holder.Player)
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\StormwindTheme.mp3" )
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("清理郊外", "暴风城的郊外到处都是邪恶的生物。杀掉他们的领袖来重新获得城市的控制", "ReplaceableTextures\\CommandButtons\\BTNNobbyMansionCastle.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00V')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n00Z')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n011')))
      call this.AddQuestItem(QuestItemUpgrade.create('h06N', 'h06K'))
      call this.AddQuestItem(QuestItemExpire.create(1020))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary