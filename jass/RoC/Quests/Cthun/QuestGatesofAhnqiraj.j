library QuestGatesofAhnqiraj requires QuestData, QuestItemKillUnit

  struct QuestGatesofAhnqiraj extends QuestData

    method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "古神克苏恩已经苏醒并准备将其拉虫人们释放到艾泽拉斯"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得克苏恩并允许开启安琪拉之门"
    endmethod

    private method OnComplete takes nothing returns nothing
      call WaygateActivateBJ(true, gg_unit_h03V_3441)
      call ShowUnitShow(gg_unit_h03V_3441)
      call WaygateSetDestinationLocBJ(gg_unit_h03V_3441, GetRectCenter(gg_rct_WorldTunnelEntrance))
      call WaygateActivateBJ(true, gg_unit_h03V_3449)
      call ShowUnitShow(gg_unit_h03V_3449)
      call WaygateSetDestinationLocBJ(gg_unit_h03V_3449, GetRectCenter(gg_rct_WorldTunnelExit))
      call SetUnitInvulnerable(gg_unit_h02U_2413, false)
      call PlayThematicMusicBJ("war3mapImported\\CthunTheme.mp3")
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("安琪拉之门", "流沙之战结束时，龙族们将其拉虫族封印在了圣甲虫之墙后。在几百年后的今天，克苏恩再次准备打开祂古老帝国的大门。", "ReplaceableTextures\\CommandButtons\\BTNScarabMedal.blp")
      call this.AddQuestItem(QuestItemCastSpell.create('A0O1', true))
      return this
    endmethod
  endstruct

endlibrary