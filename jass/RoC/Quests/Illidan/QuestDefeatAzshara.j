library QuestDefeatAzshara requires NzothSetup, LegendNaga, Display

  globals
    private constant integer QUEST_RESEARCH_ID = 'R08Y'  
  endglobals

  struct QuestDefeatAzshara extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Illidan has defeated Azshara and took control of the Naga's"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You will be able to train Sea Witch"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Conquer Nazjatar", "Azshara still controls the Naga empire, conquer it to enslave more nagas to your cause.", "ReplaceableTextures\\CommandButtons\\BTNNagaSummoner.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_NAZJATAR))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_VAULT, true))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary