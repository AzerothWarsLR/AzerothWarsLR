library QuestDefeatIllidan requires NzothSetup, LegendNaga, Display

  globals
    private constant integer QUEST_RESEARCH_ID = 'R08X'  
  endglobals

  struct QuestDefeatIllidan extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "艾萨拉击败了伊利丹，夺回了娜迦的控制权"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "你将可以训练不朽守卫"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("重新召回它们", "伊利丹带着一群娜迦跑走了，打败他并带回它们", "ReplaceableTextures\\CommandButtons\\BTNMetamorphosis.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_VAULT))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_NAZJATAR, true))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary