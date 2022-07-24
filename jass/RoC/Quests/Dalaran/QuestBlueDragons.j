library QuestBlueDragons requires QuestItemControlLegend, LegendDalaran, Display

  globals
    private constant integer RESEARCH_ID = 'R00U'
    private constant integer DRAGON_ID = 'n0AC'
    private constant integer MANADAM_ID = 'R00N'
  endglobals

  struct QuestBlueDragons extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "魔枢已经被占领。蓝龙军团现在为" + this.Holder.Name + "而战。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "学会如何训练蓝龙单位"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(Holder.Player, DRAGON_ID, "你现在可以在军事区和魔枢内训练蓝龙单位了")
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(DRAGON_ID, 6)
      call this.Holder.ModObjectLimit(MANADAM_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("蓝龙军团", "诺森德的蓝龙们是艾泽拉斯的魔法守护者。它们可能会被说服自愿加入达拉然的法师们。", "ReplaceableTextures\\CommandButtons\\BTNAzureDragon.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_NEXUS, false))
      return this
    endmethod
  endstruct

endlibrary