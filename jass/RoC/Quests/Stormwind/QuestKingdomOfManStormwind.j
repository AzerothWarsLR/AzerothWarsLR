library QuestKingdomOfManStormwind requires StormwindSetup, QuestItemControlPoint, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R01N'
    private constant integer EXPERIENCE_REWARD = 6000
  endglobals

  struct QuestKingdomOfManStormwind extends QuestData
    private method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "东部王国的人民团结在暴风王国的旗帜之下。瓦里安·乌瑞恩国王万岁！"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得一项改善所有单位的研究，洛丹伦王冠和暴风城王冠被融合，而瓦里安获得" + I2S(EXPERIENCE_REWARD) + "。"
    endmethod

    private method OnComplete takes nothing returns nothing
      //Artifact
      local unit crownHolder = ARTIFACT_CROWNSTORMWIND.OwningUnit
      call RemoveItem(ARTIFACT_CROWNLORDAERON.item)
      call RemoveItem(ARTIFACT_CROWNSTORMWIND.item)
      call UnitAddItemSafe(crownHolder, ARTIFACT_CROWNEASTERNKINGDOMS.item)
      call ARTIFACT_CROWNLORDAERON.setStatus(ARTIFACT_STATUS_HIDDEN)
      call ARTIFACT_CROWNLORDAERON.setDescription("已融合")
      call ARTIFACT_CROWNSTORMWIND.setStatus(ARTIFACT_STATUS_HIDDEN)
      call ARTIFACT_CROWNSTORMWIND.setDescription("已融合")
      //Research
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
      call DisplayResearchAcquired(Holder.Player, RESEARCH_ID, 1)
      //High King Arthas
      call BlzSetUnitName(LEGEND_VARIAN.Unit, "至高王")
      call AddHeroXP(LEGEND_VARIAN.Unit, EXPERIENCE_REWARD, true)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("人类王国", "在第一次战争之前，全人类都团结在阿拉索帝国的旗帜之下。通过再次团结人类来让人类再次伟大。", "ReplaceableTextures\\CommandButtons\\BTNFireKingCrown.blp")
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_VARIAN))
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_CROWNLORDAERON))
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_CROWNSTORMWIND))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_BLACKTEMPLE, false))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n010')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01G')))
      return this
    endmethod
  endstruct

endlibrary