library QuestWyrmrestTemple requires QuestData, GeneralHelpers

  globals
    private constant integer RESEARCH_ID = 'R07S'
  endglobals

  struct QuestWyrmrestTemple extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Yor'sahj can now be trained at the altar"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The hero Yor'sahj will join Ahn'Qiraj"
    endmethod

    public static method create takes nothing returns thistype
      //Todo: the flavour of this doesn't add up. The description implies you need to do something to Wyrmrest Temple, 
      //but actually you need to take the Demon Soul there and kill 3 dragons. What's the connection to the Demon Soul in particular?
      local thistype this = thistype.allocate("The Siege of Wyrmrest Temple", "Yor'sahj the Unsleeping's mission is to destroy the Wyrmrest temple, assist him and he will join the Black Empire", "ReplaceableTextures\\CommandButtons\\BTNHeroMastermind.blp")
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_DEMONSOUL))
      call this.AddQuestItem(QuestItemArtifactInRect.create(ARTIFACT_DEMONSOUL, gg_rct_WyrmrestTemple, "Wyrmrest Temple"))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_SARAGOSA))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_VAELASTRASZ))
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_OCCULUS))
      set this.ResearchId = RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary