library QuestLumberQuota requires QuestData, WarsongSetup

  globals
    private constant integer RESEARCH_ID = 'R05O'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R05R'   //This research is given when the quest is completed
  endglobals

  struct QuestLumberQuota extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Darkspear Hold has joined us and the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Darkspear Hold"
    endmethod

    private method GrantDarkspear takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Darkspear
      call GroupEnumUnitsInRect(tempGroup, gg_rct_EchoUnlock, null)
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
      call this.GrantDarkspear(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantDarkspear(this.Holder.Player)
      call AdjustPlayerStateBJ( 3000, FACTION_FROSTWOLF.Player, PLAYER_STATE_RESOURCE_LUMBER )
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\WarsongTheme.mp3" )
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Warchief Lumber Quota", "Once we have completed this vital mission for the Warchief, he will intercede for us with the Darkspear Trolls", "ReplaceableTextures\\CommandButtons\\BTNOrcLumberMill.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'o02S'))
      call this.AddQuestItem(QuestItemExpire.create(1500))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary