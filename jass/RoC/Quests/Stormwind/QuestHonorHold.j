//When Hellfire Citadel is destroyed, give Honor Hold to Stormwind if they are in the game, and modify doodads for visuals.
//If Stormwind is not in the game, do nothing.
library QuestHonorHold requires QuestData, StormwindSetup, GeneralHelpers

  struct QuestHonorHold extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "荣耀堡现在不再受到不断逼近的地狱火堡垒的威胁。达纳斯·托尔贝恩和他的人民选择重新加入联盟。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得半英雄达纳斯·托尔贝恩，荣耀堡的所有单位和建筑"
    endmethod

    private method OnComplete takes nothing returns nothing
      local group tempGroup = CreateGroup()
      //Transfer all Neutral Passive units in HonorHold to one of the above factions
      call UnitRescue(gg_unit_h05Z_3325, this.Holder.Player)  //Honor Hold
      call UnitRescue(gg_unit_hbla_3319, this.Holder.Player)  //Blacksmith  
      call UnitRescue(gg_unit_h03W_1656, this.Holder.Player)  //Danath Trollbane
      call UnitRescue(gg_unit_hgtw_3320, this.Holder.Player)  //Guard Tower
      call UnitRescue(gg_unit_hars_3321, this.Holder.Player)  //Arcane Sanctum
      call FACTION_STORMWIND.ModObjectLimit('h03W',1)               //Danath Trollbane
      //Set animations of doodads within Honor Hold
      call SetDoodadAnimationRectBJ( "hide", 'ISrb', gg_rct_HonorHold )
      call SetDoodadAnimationRectBJ( "hide", 'LSst', gg_rct_HonorHold )
      call SetDoodadAnimationRectBJ( "unhide", 'CSra', gg_rct_HonorHold )    
      //Cleanup
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("荣耀堡", "尽管外域的气候异常恶劣，一些联盟部队还是设法在那里建立了一个叫做荣誉堡的小镇", "ReplaceableTextures\\CommandButtons\\BTNHumanBarracks.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_HELLFIRECITADEL))
      return this
    endmethod
  endstruct

endlibrary