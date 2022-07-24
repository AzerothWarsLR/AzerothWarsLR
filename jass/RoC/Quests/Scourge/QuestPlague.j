library QuestPlague requires QuestData, ScourgeSetup

  globals
    private constant integer RESEARCH_ID = 'R06I'
    private constant integer QUEST_RESEARCH_ID = 'R009'
  endglobals

  struct QuestPlague extends QuestData
    private method Global takes nothing returns boolean
      return true
    endmethod

    private method operator CompletionPopup takes nothing returns string
      return "瘟疫爆发了！洛丹伦的平民正在迅速转变为无脑的僵尸"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "瘟疫将释放到洛丹伦的土地之上"
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, -UNLIMITED)
      call SetUnitInvulnerable( gg_unit_n035_1269, false )
      call TriggerExecute( gg_trg_Plague_Actions )
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.ModObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("亡灵瘟疫", "你可以在洛丹伦的土地上发动毁灭性的僵尸瘟疫。当瘟疫开始后，你可以输入-off来停止大锅僵尸的生成。输入-end来停止将平民们转化为僵尸。", "ReplaceableTextures\\CommandButtons\\BTNPlagueBarrel.blp")
      call this.AddQuestItem(QuestItemEitherOf.create(QuestItemResearch.create(RESEARCH_ID, 'u000'), QuestItemTime.create(900)))
      call this.AddQuestItem(QuestItemTime.create(720))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary