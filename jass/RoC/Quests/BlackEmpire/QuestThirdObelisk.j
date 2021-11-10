library QuestThirdObelisk requires QuestData, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R07K'   //This research is given when the quest is completed
    private timer NyalothaFailTimer
    private boolean QuestFailed = false
  endglobals

      private function OnTimeElapsed takes nothing returns nothing
      call RemoveDestructable( gg_dest_ATg2_35871 )
      call RemoveDestructable( gg_dest_ATg1_35873 )
      call RemoveDestructable( gg_dest_ATg3_35869 )
      call RemoveDestructable( gg_dest_ATg3_35872 )
      call GroupClear( udg_BlackEmpirePortals )
      call WaygateActivateBJ( true, gg_unit_h03V_0257 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0257, GetRectCenter(gg_rct_NyTanaris) )

      call WaygateActivateBJ( true, gg_unit_h03V_1110 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_1110, GetRectCenter(gg_rct_NyNorth) )

      call WaygateActivateBJ( true, gg_unit_h03V_0396 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0396, GetRectCenter(gg_rct_NyHighland) )

      call WaygateActivateBJ( true, gg_unit_n07F_1101 )
      call WaygateSetDestinationLocBJ( gg_unit_n07F_1101, GetRectCenter(gg_rct_Ny_Ulduar_Interior) )

      call WaygateActivateBJ( true, gg_unit_n07F_1001 )
      call WaygateSetDestinationLocBJ( gg_unit_n07F_1001, GetRectCenter(gg_rct_Ny_Silithus_Interior) )

      call WaygateActivateBJ( true, gg_unit_n07F_1069 )
      call WaygateSetDestinationLocBJ( gg_unit_n07F_1069, GetRectCenter(gg_rct_Ny_Twilight_Highlands_Interior) )

      call WaygateActivateBJ( false, gg_unit_h03V_0183 )
    endfunction

  struct QuestThirdObelisk extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "Ny'alotha has been linked to the world of Azeroth permanently."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Ny'alotha portals will be permanently opened and the Old God Yogg'saron will be available to be freed"
    endmethod

    private method OnFail takes nothing returns nothing
      set QuestFailed = true
    endmethod

    private method OnComplete takes nothing returns nothing
      
      call GroupClear( udg_BlackEmpirePortals )
      call WaygateActivateBJ( true, gg_unit_h03V_0257 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0257, GetRectCenter(gg_rct_NyTanaris) )

      call WaygateActivateBJ( true, gg_unit_h03V_1110 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_1110, GetRectCenter(gg_rct_NyNorth) )

      call WaygateActivateBJ( true, gg_unit_h03V_0396 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0396, GetRectCenter(gg_rct_NyHighland) )

      call WaygateActivateBJ( true, gg_unit_n07F_1101 )
      call WaygateSetDestinationLocBJ( gg_unit_n07F_1101, GetRectCenter(gg_rct_Ny_Ulduar_Interior) )

      call WaygateActivateBJ( true, gg_unit_n07F_1001 )
      call WaygateSetDestinationLocBJ( gg_unit_n07F_1001, GetRectCenter(gg_rct_Ny_Silithus_Interior) )

      call WaygateActivateBJ( true, gg_unit_n07F_1069 )
      call WaygateSetDestinationLocBJ( gg_unit_n07F_1069, GetRectCenter(gg_rct_Ny_Twilight_Highlands_Interior) )

      call WaygateActivateBJ( false, gg_unit_h03V_0183 )

      call FACTION_BLACKEMPIRE.ModObjectLimit('u02E', -UNLIMITED)           //Herald
    
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Merging of Realities", "The Third Obelisk will finally complete the merging of Ny'alotha with Azeroth, it must be summoned in Tanaris", "ReplaceableTextures\\CommandButtons\\BTNHorrorSoul.blp")
      call this.AddQuestItem(QuestItemBuild.create('n0BA', 3))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID

      set NyalothaFailTimer = CreateTimer()
      call TimerStart(NyalothaFailTimer, 960, false, function OnTimeElapsed)
      return this
    endmethod
  endstruct

endlibrary