library QuestExilePath requires QuestData, NagaSetup

  globals
    private constant integer RESEARCH_ID = 'R063'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R04X'   //This research is given when the quest is completed
  endglobals

  struct QuestExilePath extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "Undercity is now under the " + this.Holder.Team.Name + " and they have declared independance."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Undercity, unlock Nathanos and unally the Legion team"
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

    private method OnComplete takes nothing returns nothing
      call this.GrantNazjatar(this.Holder.Player)
      call WaygateActivateBJ( true, gg_unit_n08F_1739 )
      call WaygateActivateBJ( true, gg_unit_n08F_1798 )
      call ShowUnitShow( gg_unit_n08F_1739 )
      call ShowUnitShow( gg_unit_n08F_1798 )
      call WaygateSetDestinationLocBJ( gg_unit_n08F_1739, GetRectCenter(gg_rct_Undercity_Interior_2) )
      call WaygateSetDestinationLocBJ( gg_unit_n08F_1798, GetRectCenter(gg_rct_Undercity_Interior_1) )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("A Parting of Ways", "The Forsaken had enough of living under the tyranny of the Lich King. Sylvanas has vowed to give them their freedom back and a home", "ReplaceableTextures\\CommandButtons\\BTNForsakenArrows.blp")
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