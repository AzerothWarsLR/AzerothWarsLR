library QuestRedemptionPath requires QuestData, NagaSetup, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R062'         //This research is required to complete the quest
    private constant integer QUEST_RESEARCH_ID = 'R06S'   //This research is given when the quest is completed
  endglobals

  struct QuestRedemptionPath extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "Nazjatar and the Aetheneum is now under the influence of the Night Elves."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in the Aetheneum. Join the Night Elves and enable to train Altruis."
    endmethod

    private method OnComplete takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_AethneumCatacombs, this.Holder.Player)
      call FACTION_NAGA.ModObjectLimit('n08H', UNLIMITED)   //Demon Hunter grounds
      call FACTION_NAGA.ModObjectLimit('e00S', UNLIMITED)   //Glaive Warrior
      call FACTION_NAGA.ModObjectLimit('h08W', 6)   //Demon Hunter
      set EXILE_PATH.Progress = QUEST_PROGRESS_FAILED     
      call RescueNeutralUnitsInRect(gg_rct_AethneumCatacombs, this.Holder.Player)
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
      set this.Holder.Team = TEAM_NIGHT_ELVES
      call DestructableRestoreLife( gg_dest_YT24_0267, GetDestructableMaxLife(GetLastCreatedDestructable()), true )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Brothers Stormrage", "Illidan follows his heart and seeks forgivness from Malfurion. United by their brotherly bond and their desire to protect Tyrande, they decide to unite their forces once again.", "ReplaceableTextures\\CommandButtons\\BTNDemonHunter2.blp")
      call this.AddQuestItem(QuestItemResearch.create(RESEARCH_ID, 'n055'))
      call this.AddQuestItem(QuestItemSelfExists.create())
      call this.AddQuestItem(QuestItemLegendReachRect.create(LEGEND_ILLIDAN, gg_rct_NazjatarHidden, "Finished Campaign"))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary