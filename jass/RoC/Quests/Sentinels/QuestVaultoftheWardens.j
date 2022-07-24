library QuestVaultoftheWardens requires QuestData, SentinelsSetup, QuestItemControlPoint

  globals
    private constant integer RESEARCH_ID = 'R06H'
    private constant integer WARDEN_ID = 'h045'
  endglobals

  struct QuestVaultoftheWardens extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "随着破碎群岛和萨格拉斯之墓被控制，一座名为守望者地窟的高度设防监狱的建设工作已经开始."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "在破碎群岛上获得守望者地窟和4个守望者并允许训练守望者单位"
    endmethod

    private method OnComplete takes nothing returns nothing
      call CreateUnit(this.Holder.Player, 'n04G', GetRectCenterX(gg_rct_VaultoftheWardens), GetRectCenterY(gg_rct_VaultoftheWardens), 220)
      call CreateUnits(this.Holder.Player, WARDEN_ID, GetRectCenterX(gg_rct_VaultoftheWardens), GetRectCenterY(gg_rct_VaultoftheWardens), 270, 4)
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
      call DisplayUnitTypeAcquired(Holder.Player, WARDEN_ID, "你现在可以从守望者地窟、哨兵飞地和你的首都训练守望者.")
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(WARDEN_ID, 8)
      call this.Holder.ModObjectLimit(RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("守望者地窟", "在过去的几千年里，艾泽拉斯最邪恶的生物们都被囚禁在辛艾萨莉附近的一个设施里。现在从海底升起的破碎群岛将可以作为一个新监狱建造的战略地点。", "ReplaceableTextures\\CommandButtons\\BTNReincarnationWarden.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n05Y')))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary