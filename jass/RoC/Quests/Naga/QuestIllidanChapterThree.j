//Escapes Kalimdor, Find the Skull of Guldan
library QuestIllidanChapterThree requires QuestData, QuestItemLegendReachRect, QuestItemLegendDead, LegendNaga, GlobalQuest

   globals
    private constant integer RITUAL_ID = 'A0KY'
  endglobals
 
  struct QuestIllidanChapterThree extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "Illidan must awaken the Naga from the depth of the ocean"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Nazjatar and the Naga's loyalty"
    endmethod

    private method GrantNagaSmall takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Nagastarting base
      call GroupEnumUnitsInRect(tempGroup, gg_rct_NagaUnlock1, null)
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
      call this.GrantNagaSmall(this.Holder.Player)
      call FACTION_NAGA.AddQuest(REDEMPTION_PATH)
      set REDEMPTION_PATH.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_NAGA.AddQuest(EXILE_PATH)
      set EXILE_PATH.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_NAGA.AddQuest(MADNESS_PATH)
      set MADNESS_PATH.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_NAGA.AddQuest(ALLIANCE_NAGA)
      set ALLIANCE_NAGA.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_NAGA.AddQuest(CONQUER_BLACK_TEMPLE)
      set CONQUER_BLACK_TEMPLE.Progress = QUEST_PROGRESS_UNDISCOVERED
      call FACTION_NAGA.AddQuest(KILL_FROZEN_THRONE)
      set KILL_FROZEN_THRONE.Progress = QUEST_PROGRESS_UNDISCOVERED
      call WaygateActivateBJ( true, gg_unit_h01D_3378 )
      call ShowUnitShow( gg_unit_h01D_3378 )
      call WaygateSetDestinationLocBJ( gg_unit_h01D_3378, GetRectCenter(gg_rct_NazjatarExit2) )
      call WaygateActivateBJ( true, gg_unit_h01A_0402 )
      call ShowUnitShow( gg_unit_h01A_0402 )
      call WaygateSetDestinationLocBJ( gg_unit_h01A_0402, GetRectCenter(gg_rct_NazjatarExit1) )
      call WaygateActivateBJ( true, gg_unit_h01D_3381 )
      call ShowUnitShow( gg_unit_h01D_3381 )
      call WaygateSetDestinationLocBJ( gg_unit_h01D_3381, GetRectCenter(gg_rct_NazjatarEntrance1) )
      call WaygateActivateBJ( true, gg_unit_h01D_3384 )
      call ShowUnitShow( gg_unit_h01D_3384 )
      call WaygateSetDestinationLocBJ( gg_unit_h01D_3384, GetRectCenter(gg_rct_NazjatarEntrance2) )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Chapter Three: Dwellers from the Deep", "Awakening the Naga's will give Illidan the army he needs to achieve his goals", "ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidon.blp")
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_StartQuest3, "the exit"))
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_MaelstromAmbient, "the Maelstrom"))
      call this.AddQuestItem(QuestItemCastSpell.create(RITUAL_ID, true))
      return this
    endmethod
  endstruct

endlibrary  