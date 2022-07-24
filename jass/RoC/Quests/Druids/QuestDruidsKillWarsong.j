library QuestDruidsKillWarsong requires DruidsSetup, LegendWarsong, Display

  globals
    private constant integer UNITTYPE_ID = 'e012' //Siege Ancient
    private constant integer RESEARCH_ID = 'R05A' //Research enabling Siege Ancient
  endglobals

  struct QuestDruidsKillWarsong extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "卡利姆多上战歌的存在已经被抹除了。神圣的大地不再受到他们斧头的威胁了。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "可以训练" + GetObjectName(UNITTYPE_ID)
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(this.Holder.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(this.Holder.Player, UNITTYPE_ID, "你现在可以在战争古树内训练攻城古树")
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(UNITTYPE_ID, 6) //Siege Ancient
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("门口的敌人", "战歌氏族的兽人们从另外一颗星球出发，穿越艾泽拉斯的海洋来到这里蹂躏荒野并消耗它的馈赠。必须阻止他们。", "ReplaceableTextures\\CommandButtons\\BTNHellScream.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_STONEMAUL))
      return this
    endmethod
  endstruct

endlibrary