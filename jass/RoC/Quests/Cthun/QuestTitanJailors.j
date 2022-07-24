library QuestTitanJailors requires QuestData, CthunSetup, QuestItemKillUnit, GeneralHelpers

  globals
    private constant integer QUEST_RESEARCH_ID = 'R07B'   //This research is given when the quest is completed
  endglobals

  struct QuestTitanJailors extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "看守克苏恩沉眠之地的泰坦看守者已经被摧毁。现在，没有什么能阻挡其拉虫族和它们的主人了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得安其拉神殿内部所有的单位和建筑并解锁唤醒克苏恩的法术。"
    endmethod

    private method OnFail takes nothing returns nothing
      call RescueNeutralUnitsInRect(gg_rct_TunnelUnlock, Player(PLAYER_NEUTRAL_AGGRESSIVE))
      call WaygateActivateBJ( true, gg_unit_h03V_0591 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0591, GetRectCenter(gg_rct_Silithus_Stone_Interior) )
    endmethod

    private method OnComplete takes nothing returns nothing
      call WaygateActivateBJ( true, gg_unit_h03V_0591 )
      call WaygateSetDestinationLocBJ( gg_unit_h03V_0591, GetRectCenter(gg_rct_Silithus_Stone_Interior) )
      call RescueNeutralUnitsInRect(gg_rct_TunnelUnlock, this.Holder.Player)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("古神的狱卒", "古神克苏恩被囚禁在安其拉神庙的深处，有泰坦留下的机械典狱官看守着。", "ReplaceableTextures\\CommandButtons\\BTNArmorGolem.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_nsgg_1490)) //Golem
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n02K')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n078')))
      call this.AddQuestItem(QuestItemExpire.create(1428))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary