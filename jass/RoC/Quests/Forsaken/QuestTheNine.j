library QuestTheNine requires QuestData, ForsakenSetup

  struct QuestTheNine extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "允许训练最多9名瓦格里"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "允许训练最多9名瓦格里"
    endmethod

    private method OnComplete takes nothing returns nothing
    call FACTION_FORSAKEN.ModObjectLimit('u01V', 5)           //Valyr
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("九武神", "大多数的瓦格里仍然在诺森德巫妖王的控制之下，她们需要加入被遗忘者的大业", "ReplaceableTextures\\CommandButtons\\BTNPaleValkyr.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_SYLVANASV, false))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n02J')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n03U')))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_LICHKING))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary