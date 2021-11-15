library QuestMadnessPath requires QuestData, NagaSetup

  globals
    private constant integer RESEARCH_ID = 'R065'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R033'   //This research is given when the quest is completed
  endglobals

  struct QuestMadnessPath extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "Nazjatar is now under the influence of the Old Gods and the portal is opened to Ny'alotha."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Nazjatar and a portal is opened to Ny'alotha. Join the Old Gods team"
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
      call SetUnitOwner(LEGEND_NZOTH.Unit, this.Holder.Player, true)
      call FACTION_NAGA.ModObjectLimit('n08V', UNLIMITED)   //Depth Void Portal
      call FACTION_NAGA.ModObjectLimit('h01Q', 4)   //Immortal Guardian
      call LEGEND_AZSHARA.Spawn(Holder.Player, GetRectCenterX(gg_rct_InstanceNazjatar), GetRectCenterY(gg_rct_InstanceNazjatar), 270)
      call SetHeroLevel(LEGEND_AZSHARA.Unit, 9, false)
      call SetUnitPositionLoc( LEGEND_AZSHARA.Unit, GetRectCenter(gg_rct_NzothIni) )
      call SetUnitPositionLoc( LEGEND_AZSHARA.Unit, GetRectCenter(gg_rct_IllidanNaga1) )
      set REDEMPTION_PATH.Progress = QUEST_PROGRESS_FAILED
      set EXILE_PATH.Progress = QUEST_PROGRESS_FAILED
      call SetUnitOwner(LEGEND_ILLIDAN.Unit, Player(PLAYER_NEUTRAL_AGGRESSIVE), true)
      call this.GrantNazjatar(this.Holder.Player)
      call WaygateActivateBJ( true, gg_unit_h03V_0183 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0183, GetRectCenter(gg_rct_NazjatarExit3) )
      call WaygateActivateBJ( true, gg_unit_n07E_0958 )
      call ShowUnitShow( gg_unit_n07E_0958  )
      call WaygateSetDestinationLocBJ( gg_unit_n07E_0958, GetRectCenter(gg_rct_Ny_Nazjatar_Interior) )
      set this.Holder.Team = TEAM_OLDGOD
      set this.Holder.Name = "Nazjatar"
      set this.Holder.Icon = "ReplaceableTextures\\CommandButtons\\BTNNagaSummoner.blp"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Voices in the Void", "Azshara takes command of the Naga in the name of N'zoth. Illidan reign is no more.", "ReplaceableTextures\\CommandButtons\\BTNGuardianofTheSea.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'n055'))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ILLIDAN, true))
      call this.AddQuestItem(QuestItemSelfExists.create())
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_NazjatarHidden, "Nazjatar"))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary