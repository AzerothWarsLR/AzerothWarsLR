library QuestNazjatar requires QuestData, QuestItemLegendReachRect, QuestItemCastSpell, LegendNaga, GlobalQuest, GeneralHelpers
 
  globals 
    private constant integer QUEST_RESEARCH_ID = 'R08V'   //This research is given when the quest is completed
  endglobals
  
  struct QuestNazjatar extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "艾萨拉重建了纳沙塔尔帝国"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "解锁纳沙塔尔恩佐斯和波涛之柱，你的食物限制将提高到200。"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_NagaUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
    endmethod


    private method OnComplete takes nothing returns nothing
      call FACTION_NZOTH.ModObjectLimit('n0C2', UNLIMITED)   //Pillar of Waves
      call RescueNeutralUnitsInRect(gg_rct_NagaUnlock, this.Holder.Player)
      call SetUnitInvulnerable(gg_unit_n045_3377, true)
      call SetPlayerStateBJ( this.Holder.Player, PLAYER_STATE_FOOD_CAP_CEILING, 150 )
      set BLACKEMPIREPORTAL_ILLIDAN.PortalState = BLACKEMPIREPORTALSTATE_OPEN
      call FACTION_NZOTH.ModObjectLimit('nmpe', UNLIMITED)   //Mur'gul Slave
      call WaygateActivateBJ( true, gg_unit_h01A_0402 )
      call WaygateSetDestinationLocBJ( gg_unit_h01A_0402 , GetRectCenter(gg_rct_NazjatarExit1) )
      call WaygateActivateBJ( true, gg_unit_h01D_3378 )
      call WaygateSetDestinationLocBJ( gg_unit_h01D_3378, GetRectCenter(gg_rct_NazjatarExit2) )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("重建纳沙塔尔帝国", "艾萨拉需要重建她辉煌的帝国。因此她需要大量资源。", "ReplaceableTextures\\CommandButtons\\BTNTempleOfTides.blp")
      call this.AddQuestItem(QuestItemUpgrade.create('n0C9', 'n0C2'))
      call this.AddQuestItem(QuestItemResearch.create('R08Q', 'n0C9'))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary  