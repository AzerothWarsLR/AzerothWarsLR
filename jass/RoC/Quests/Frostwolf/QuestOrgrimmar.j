library QuestOrgrimmar requires QuestData, FrostwolfSetup

  globals
    private constant integer QUEST_RESEARCH_ID = 'R03S'   //This research is given when the quest is completed
    private constant integer RESEARCH_ID = 'R05I'         //This research is required to complete the quest
  endglobals

  struct QuestOrgrimmar extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Orgrimmar has been constructed and is now under the control of the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Orgrimmar and enables Rexxar to be trained at the altar"
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
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\OrgrimmarTheme.mp3" )
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("To Tame a Land", "This new continent is ripe for opportunity, if the Horde is going to survive, a new city needs to be built", "ReplaceableTextures\\CommandButtons\\BTNFortress.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'ofrt'))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary