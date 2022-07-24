library QuestFirstWave requires QuestData, DraeneiSetup

  struct QuestFirstWave extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "德莱尼已经坚持了足够长的时间让他们大部分的平民都进入了埃索达"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "秘蓝岛上的神圣堡垒、星界圣所和水晶尖塔不会被删除t。你将不会失去你在外域采集的黄金。"
    endmethod

    private method OnFail takes nothing returns nothing
      call KillUnit(gg_unit_o051_3356)
      call KillUnit(gg_unit_o055_3337)
      call KillUnit(gg_unit_o054_3338)
      call AdjustPlayerStateBJ( -( 2000 - GetResourceAmount(gg_unit_ngol_3272) ), Player(13), PLAYER_STATE_RESOURCE_GOLD )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("破碎的文明", "邪兽人的攻击随时都会开始，德莱尼人必须将平民都疏散到埃索达上", "ReplaceableTextures\\CommandButtons\\BTNDraeneiDivineCitadel.blp")
      call this.AddQuestItem(QuestItemTime.create(540))
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_EXODARSHIP))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary