library QuestLumberQuota requires QuestData, WarsongSetup

  globals
    private constant integer RESEARCH_ID = 'R05O'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R05R'   //This research is given when the quest is completed
  endglobals

  struct QuestLumberQuota extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Orgrimmar has been founded and has joined us and the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Orgrimmar, able to train Varok"
    endmethod

    private method GrantOrgrimmar takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Orgrimmar
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Orgrimmar, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) and GetUnitFoodUsed(u) != 10  then
          call UnitRescue(u, whichPlayer)
        else
          if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, Player(PLAYER_NEUTRAL_PASSIVE))
          endif
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnFail takes nothing returns nothing
      call this.GrantOrgrimmar(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantOrgrimmar(this.Holder.Player)
      call AdjustPlayerStateBJ( 3000, FACTION_FROSTWOLF.Player, PLAYER_STATE_RESOURCE_LUMBER )
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\OrgrimmarTheme.mp3" )
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("To Tame a Land", "This new continent is ripe for opportunity, if the Horde is going to survive, a new city needs to be built", "ReplaceableTextures\\CommandButtons\\BTNFortress.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'o02S'))
      call this.AddQuestItem(QuestItemExpire.create(1500))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary