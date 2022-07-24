library QuestUndercity requires QuestData, ForsakenSetup, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R050'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R04X'   //This research is given when the quest is completed
  endglobals

  struct QuestUndercity extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "Undercity is now under the " + this.Holder.Team.Name + " and they have declared independance."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Undercity, unlock Nathanos and unally the Legion team. All your units in Northrend will go Hostile!"
    endmethod

    private method EmptyNR takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Dalaran
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Northrend_Ambiance, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == this.Holder.Player then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call GroupEnumUnitsInRect(tempGroup, gg_rct_InstanceAzjolNerub, null)      
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == this.Holder.Player then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    private method UnhideUnit takes nothing returns nothing
      local unit u
      loop
        set u = FirstOfGroup(udg_HiddenUnits3)
        exitwhen u == null
        call ShowUnitShow(u)
        call GroupRemoveUnit(udg_HiddenUnits3, u)
      endloop
      call DestroyGroup(udg_HiddenUnits3)
    endmethod
    
    private method OnFail takes nothing returns nothing
      call UnhideUnit()
      call RescueNeutralUnitsInRect(gg_rct_UndercityUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod

    private method OnComplete takes nothing returns nothing
      call UnhideUnit()
      call RescueNeutralUnitsInRect(gg_rct_UndercityUnlock, this.Holder.Player)
      call this.EmptyNR(Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call SetPlayerTechResearched(FACTION_LORDAERON.Player, 'R08G', 1)
      call SetPlayerTechResearched(FACTION_LEGION.Player, 'R08G', 1)
      call WaygateActivateBJ( true, gg_unit_n08F_1739 )
      call WaygateActivateBJ( true, gg_unit_n08F_1798 )
      call ShowUnitShow( gg_unit_n08F_1739 )
      call ShowUnitShow( gg_unit_n08F_1798 )
      call WaygateSetDestinationLocBJ( gg_unit_n08F_1739, GetRectCenter(gg_rct_Undercity_Interior_2) )
      call WaygateSetDestinationLocBJ( gg_unit_n08F_1798, GetRectCenter(gg_rct_Undercity_Interior_1) )
      set this.Holder.Team = TEAM_FORSAKEN
      set this.Holder.Name = "Forsaken"
      set this.Holder.Icon = "ReplaceableTextures\\CommandButtons\\BTNBansheeRanger.blp"
      call SetPlayerStateBJ( this.Holder.Player, PLAYER_STATE_FOOD_CAP_CEILING, 250 )
      call PlayThematicMusicBJ( "war3mapImported\\ForsakenTheme.mp3" )
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Forsaken Independance", "The Forsaken had enough of living under the tyranny of the Lich King. Sylvanas has vowed to give them their freedom back and a home", "ReplaceableTextures\\CommandButtons\\BTNForsakenArrows.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'h08B'))
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_SYLVANASV, gg_rct_Terenas, "Capital City"))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_CAPITALPALACE))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary