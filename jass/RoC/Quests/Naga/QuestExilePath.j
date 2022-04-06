library QuestExilePath requires QuestData, NagaSetup

  globals
    private constant integer RESEARCH_ID = 'R063'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R008'   //This research is given when the quest is completed
  endglobals

  struct QuestExilePath extends QuestData

    private method GrantAkama takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Exiled
      call GroupEnumUnitsInRect(tempGroup, gg_rct_AkamaUnlock, null)
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

    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "Illidan has invaded Outland and has allied himself with the Draenei Broken Ones."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Open a portal to Outland, grants you the Draenei village near it, enables you to train Akama, Najentus and Draenei units, grants you 300 food limit and grants you 800 gold"
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GrantAkama(this.Holder.Player)
      call FACTION_NAGA.ModObjectLimit('n08W', UNLIMITED)   //Lost One Den
      call FACTION_NAGA.ModObjectLimit('ndrn', UNLIMITED)   //Vindicator
      call FACTION_NAGA.ModObjectLimit('ndrs', 6)   //Seer
      set REDEMPTION_PATH.Progress = QUEST_PROGRESS_FAILED
      set this.Holder.Team = TEAM_NAGA
      call WaygateActivateBJ( true, gg_unit_n07E_1491 )
      call ShowUnitShow( gg_unit_n07E_1491  )
      call WaygateSetDestinationLocBJ( gg_unit_n07E_1491, GetRectCenter(gg_rct_AetheneumTombExit2) )

      call SetPlayerTechResearched(FACTION_SENTINELS.Player, 'R06D', 1)
      set this.Holder.Name = "Illidari"
      
      call WaygateActivateBJ( true, gg_unit_h01D_3380 )
      call ShowUnitShow( gg_unit_h01D_3380 )
      call WaygateSetDestinationLocBJ( gg_unit_h01D_3380 , GetRectCenter(gg_rct_IllidanOutlandEntrance) )

      call SetPlayerStateBJ( this.Holder.Player, PLAYER_STATE_FOOD_CAP_CEILING, 300 )
      call AdjustPlayerStateBJ( 800, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("A Parting of Ways", "Illidan must go his own way to find power, and Outland is the perfect place to acquire it.", "ReplaceableTextures\\CommandButtons\\BTNIllidanDemonicPower.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'n055'))
      call this.AddQuestItem(QuestItemSelfExists.create())
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_NazjatarHidden, "Finished Campaign"))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary