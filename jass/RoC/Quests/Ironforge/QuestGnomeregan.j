library QuestGnomeregan requires QuestData, IronforgeSetup, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R05Q'
  endglobals

  struct QuestGnomeregan extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "诺莫瑞根已经被解放，它的军队现在可以自由协助" + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得诺莫瑞根所有建筑和单位"
    endmethod

    private method GrantGnomeregan takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Gnomeregan
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Gnomergan, null)
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
      call this.GrantGnomeregan(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, 'R05Q', 1) 
      call this.GrantGnomeregan(this.Holder.Player)
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("发明之城", "长久以来，由于穴居人和冰巨魔的侵扰，诺莫瑞根的居民们一直无法协助联盟作战。为他们解决冰巨魔来获得他们的支持。", "ReplaceableTextures\\CommandButtons\\BTNFlyingMachine.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_nitw_1513)) //Ice Troll Warlord
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary