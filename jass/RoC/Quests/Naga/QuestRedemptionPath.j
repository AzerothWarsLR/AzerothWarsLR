library QuestRedemptionPath requires QuestData, NagaSetup

  globals
    private constant integer RESEARCH_ID = 'R062'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R04X'   //This research is given when the quest is completed
  endglobals

  struct QuestRedemptionPath extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "Nazjatar and the Aetheneum is now under the influence of the Night Elves."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Nazjatar and Aetheneum. Join the Night Elves"
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

    private method GrantAetheneum takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Undercity
      call GroupEnumUnitsInRect(tempGroup, gg_rct_AethneumCatacombs, null)
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

    private method OnComplete takes nothing returns nothing
      set EXILE_PATH.Progress = QUEST_PROGRESS_FAILED
      set MADNESS_PATH.Progress = QUEST_PROGRESS_FAILED
      call this.GrantNazjatar(this.Holder.Player)
      call this.GrantAetheneum(this.Holder.Player)
      call WaygateActivateBJ( true, gg_unit_h01D_3387 )
      call WaygateActivateBJ( true, gg_unit_h01D_3385 )
      call WaygateActivateBJ( true, gg_unit_h01D_3379 )
      call WaygateActivateBJ( true, gg_unit_h01D_3380 )
      call ShowUnitShow( gg_unit_h01D_3387 )
      call ShowUnitShow( gg_unit_h01D_3385 )
      call ShowUnitShow( gg_unit_h01D_3380 )
      call ShowUnitShow( gg_unit_h01D_3379 )
      call WaygateSetDestinationLocBJ( gg_unit_h01D_3387, GetRectCenter(gg_rct_AetheneumTombExit2) )
      call WaygateSetDestinationLocBJ( gg_unit_h01D_3385 , GetRectCenter(gg_rct_AethneumTombExit) )
      call WaygateSetDestinationLocBJ( gg_unit_h01D_3380 , GetRectCenter(gg_rct_AetheneumTombEntrance2) )
      call WaygateSetDestinationLocBJ( gg_unit_h01D_3379 , GetRectCenter(gg_rct_AethneumLibraryEntrance) )
      call WaygateActivateBJ( true, gg_unit_n07E_0958 )
      call ShowUnitShow( gg_unit_n07E_0958  )
      call WaygateSetDestinationLocBJ( gg_unit_n07E_0958, GetRectCenter(gg_rct_AetheneumtoNazjatar) )
      call WaygateActivateBJ( true, gg_unit_n07E_1154 )
      call ShowUnitShow( gg_unit_n07E_1154  )
      call WaygateSetDestinationLocBJ( gg_unit_n07E_1154, GetRectCenter(gg_rct_NazjatarExit3) )
      set this.Holder.Team = TEAM_NIGHT_ELVES
      call DestructableRestoreLife( gg_dest_YT24_0267, GetDestructableMaxLife(GetLastCreatedDestructable()), true )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Brothers Stormrage", "Illidan follows his heart and seeks forgivness to Malfurion. United by their brotherly bond and their desire to protect Tyrande, they decide to unite forces again.", "ReplaceableTextures\\CommandButtons\\BTNDemonHunter2.blp")
      call this.AddQuestItem(QuestItemUpgrade.create('n055', 'nntt'))
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'n055'))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ILLIDAN, true))
      call this.AddQuestItem(QuestItemSelfExists.create())
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_NazjatarHidden, "Nazjatar"))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary