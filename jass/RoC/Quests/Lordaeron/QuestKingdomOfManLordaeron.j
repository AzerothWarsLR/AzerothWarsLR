library QuestKingdomOfManLordaeron requires LordaeronSetup, QuestItemControlPoint, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R01N'
  endglobals

  struct QuestKingdomOfManLordaeron extends QuestData
    private method operator Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "东部王国的人民团结在洛丹伦的旗帜之下。阿尔萨斯·米奈希尔国王万岁！"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得一项增强所有单位的研究，洛丹伦王冠和暴风王冠合并，阿尔萨斯成为至高王"
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
      set LEGEND_ARTHAS.UnitType = 'Harf'
      call LEGEND_ARTHAS.ClearUnitDependencies()
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("人类王国", "在第一次战争之前，全人类都团结在阿拉索帝国的旗帜之下。通过再次团结人类让人类王国再次伟大。", "ReplaceableTextures\\CommandButtons\\BTNFireKingCrown.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ARTHAS, true))
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_CROWNLORDAERON))
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_CROWNSTORMWIND))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_LICHKING))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n010')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01G')))
      return this
    endmethod
  endstruct

endlibrary