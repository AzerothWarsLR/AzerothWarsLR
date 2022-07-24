//Prince Arthas goes to the Frozen Throne after it's destroyed. He becomes King Arthas, gets the Crown of Lordaeron, and Terenas dies.
library QuestKingArthas requires QuestData, LordaeronSetup, LegendLordaeron, LegendNeutral, GeneralHelpers

  globals
    private constant integer QUEST_RESEARCH_ID = 'R08A'   //This research is given when the quest is completed
  endglobals

  struct QuestKingArthas extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "在巫妖王被消灭后，洛丹伦王国便没有了最大的威胁。泰纳瑞斯·米奈希尔国王骄傲地让位给了他的儿子。"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "阿尔萨斯获得2000点经验和洛丹伦王冠并不会永久死亡了"
    endmethod

    private method OnComplete takes nothing returns nothing
      call BlzSetUnitName(LEGEND_ARTHAS.Unit, "洛丹伦国王")
      call BlzSetUnitName(gg_unit_nemi_0019, "名誉国王泰纳瑞斯·米奈希尔")
      call RemoveUnit(gg_unit_nemi_0019)
      call AddHeroXP(LEGEND_ARTHAS.Unit, 2000, true)
      call UnitAddItemSafe(LEGEND_ARTHAS.Unit, ARTIFACT_CROWNLORDAERON.item)
      call LEGEND_ARTHAS.ClearUnitDependencies()
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("继承者", "阿尔萨斯·米奈希尔是洛丹伦王国唯一的继承人。唯一阻碍他加冕的是天灾军团所带来的末日威胁。", "ReplaceableTextures\\CommandButtons\\BTNArthas.blp")
      call this.AddQuestItem(QuestItemLegendNotPermanentlyDead.create(LEGEND_CAPITALPALACE))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_ARTHAS, true))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_LICHKING))
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_ARTHAS, gg_rct_King_Arthas_crown, "泰纳瑞斯国王"))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary