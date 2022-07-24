library QuestKarazhan requires LegendNeutral

  struct QuestKarazhan extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "卡拉赞被占领了。" + this.Holder.Name + "的档案员们在大厅里搜索着奥术资源。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "可以在卡拉赞内研究三个强大的升级。"
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit('R020', UNLIMITED)   //Rain: An Amalgam
      call Holder.ModObjectLimit('R03M', UNLIMITED)   //Methods of Control
      call Holder.ModObjectLimit('R01B', UNLIMITED)   //A Treatise on Barriers
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("卡拉赞的秘密", "麦迪文的灵魂仍在神秘的闲逛着。达拉然可以把它的强大魔法运用起来。", "ReplaceableTextures\\CommandButtons\\BTNTomeBrown.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_KARAZHAN, false))
      return this
    endmethod
  endstruct

endlibrary