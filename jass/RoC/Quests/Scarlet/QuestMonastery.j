library QuestMonastery requires QuestData, ScarletSetup

  globals
    private constant integer RESEARCH_ID = 'R03P'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R03F'   //This research is given when the quest is completed
  endglobals

  struct QuestMonastery extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Scarlet Monastery Hand is complete and ready to join the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in the Scarlet Monastery"
    endmethod

    private method GrantMonastery takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Monastery
      call GroupEnumUnitsInRect(tempGroup, gg_rct_ScarletAmbient, null)
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
      call this.GrantMonastery(Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantMonastery(this.Holder.Player)
      call WaygateActivateBJ( true, gg_unit_h00T_0786 )
      call WaygateSetDestinationLocBJ( gg_unit_h00T_0786, GetRectCenter(gg_rct_Scarlet_Monastery_Interior) )
      set this.Holder.Team = TEAM_SCARLET
      if GetLocalPlayer() == this.Holder.Player then
        call PlayThematicMusicBJ( "war3mapImported\\ScarletCrusade.mp3" )
      endif
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Secret Cloister", "The Scarlet Monastery is the perfect place for the secret base of the Scarlet Crusade ", "ReplaceableTextures\\CommandButtons\\BTNDivine_Reckoning_Icon.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'h00T'))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary