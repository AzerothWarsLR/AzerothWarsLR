library QuestDemonGateMonastery requires QuestData, LegionSetup

  globals
    private constant integer DEMONGATE_ID = 'n081'
  endglobals

  struct QuestDemonGateMonastery extends QuestData
    private QuestItemKillUnit questItemKillMonastery

    private method operator CompletionPopup takes nothing returns string
      return "血色修道院已经倒塌，而一道更大的恶魔之门从它的废墟中升起。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "在血色修道院的位置获得一个新的恶魔之门"
    endmethod

    private method OnComplete takes nothing returns nothing
      call CreateUnit(Holder.Player, DEMONGATE_ID, GetUnitX(this.questItemKillMonastery.Target), GetUnitY(this.questItemKillMonastery.Target), 270.)
      call SetDoodadAnimationRectBJ( "hide", 'YObb', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'ZSab', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'YOsw', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "show", 'LOsm', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'YOlp', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'ZCv2', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "hide", 'ZCv1', gg_rct_ScarletMonastery )
      call SetDoodadAnimationRectBJ( "show", 'ZCv1', gg_rct_ScarletMonastery )
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("血色裂缝", "血色修道院周边的有着非凡的能量。摧毁这座圣光的堡垒并在它的位置建造一个恶魔之门。", "ReplaceableTextures\\CommandButtons\\BTNMaskOfDeath.blp")
      set this.questItemKillMonastery = this.AddQuestItem(QuestItemKillUnit.create(gg_unit_h00T_0786))
      return this
    endmethod
  endstruct

endlibrary