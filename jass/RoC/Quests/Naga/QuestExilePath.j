library QuestExilePath requires QuestData, NagaSetup

  globals
    private constant integer RESEARCH_ID = 'R063'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R008'   //This research is given when the quest is completed
  endglobals

  struct QuestExilePath extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "Nazjatar is now under the influence of the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Nazjatar"
    endmethod

    private method GrantNazjatar takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Undercity
      call GroupEnumUnitsInRect(tempGroup, gg_rct_NagaUnlock2, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) and GetUnitFoodUsed(u) != 10  then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null      
    endmethod

    private method OnComplete takes nothing returns nothing
      call FACTION_NAGA.modObjectLimit('n08W', UNLIMITED)   //Lost One Den
      call FACTION_NAGA.modObjectLimit('ndrn', UNLIMITED)   //Vindicator
      call FACTION_NAGA.modObjectLimit('ndrs', 6)   //Seer
      call SetUnitOwner(LEGEND_NZOTH.Unit, Player(PLAYER_NEUTRAL_AGGRESSIVE), true)
      set REDEMPTION_PATH.Progress = QUEST_PROGRESS_FAILED
      set MADNESS_PATH.Progress = QUEST_PROGRESS_FAILED
      call this.GrantNazjatar(this.Holder.Player)
      call WaygateActivateBJ( true, gg_unit_n07E_1491 )
      call WaygateActivateBJ( true, gg_unit_n07E_0958 )
      call ShowUnitShow( gg_unit_n07E_1491  )
      call ShowUnitShow( gg_unit_n07E_0958 )
      call WaygateSetDestinationLocBJ( gg_unit_n07E_1491, GetRectCenter(gg_rct_NazjatarExit3) )
      call WaygateSetDestinationLocBJ( gg_unit_n07E_0958 , GetRectCenter(gg_rct_IllidanOutlandEntrance) )
      call SetPlayerTechResearched(FACTION_SENTINELS.Player, 'R06D', 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("A Parting of Ways", "Illidan has to go his own way to find the power and Outland is the perfect place to acquire it.", "ReplaceableTextures\\CommandButtons\\BTNIllidanDemonicPower.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'n055'))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ILLIDAN, true))
      call this.AddQuestItem(QuestItemSelfExists.create())
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_NazjatarHidden, "Nazjatar"))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary