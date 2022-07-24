library QuestThePlaguelands requires QuestData, ForsakenSetup

  struct QuestThePlaguelands extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "洛丹伦那被蹂躏的土地现在处于被遗忘者的控制之下，允许最多4名瓦格里加入并掠夺到了500金"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "可以训练最多4名瓦格里并获得500黄金"
    endmethod

    private method OnComplete takes nothing returns nothing
    call FACTION_FORSAKEN.ModObjectLimit('u01V', 2)           //Valyr
    call AdjustPlayerStateBJ( 500, this.Holder.Player, PLAYER_STATE_RESOURCE_GOLD )
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("瘟疫之地", "洛丹伦那被蹂躏的土地必须被被遗忘者征服，他们的生存取决于此", "ReplaceableTextures\\CommandButtons\\BTNNathanosBlightcaller.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_UNDERCITY, false))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01F')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n044')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01H')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n03P')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01M')))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary