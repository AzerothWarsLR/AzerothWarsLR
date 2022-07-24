library QuestWyrmrestTemple requires QuestData, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R07S'
  endglobals

  struct QuestWyrmrestTemple extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "在祭坛内可以召唤约萨希"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "约萨希将加入安其拉"
    endmethod

    public static method create takes nothing returns thistype
      //Todo: the flavour of this doesn't add up. The description implies you need to do something to Wyrmrest Temple, 
      //but actually you need to take the Demon Soul there and kill 3 dragons. What's the connection to the Demon Soul in particular?
      local thistype this = thistype.allocate("围攻龙眠神殿", "不眠的约萨希的任务是摧毁龙眠神殿，协助他来让他加入安其拉", "ReplaceableTextures\\CommandButtons\\BTNHeroMastermind.blp")
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_DEMONSOUL))
      call this.AddQuestItem(QuestItemArtifactInRect.create(ARTIFACT_DEMONSOUL, gg_rct_WyrmrestTemple, "龙眠神殿"))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_SARAGOSA))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_VAELASTRASZ))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_OCCULUS))
      set this.ResearchId = RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary