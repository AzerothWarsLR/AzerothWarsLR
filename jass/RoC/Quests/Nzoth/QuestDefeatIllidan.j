library QuestDefeatIllidan requires NzothSetup, LegendNaga, Display

  globals
    private constant integer QUEST_RESEARCH_ID = 'R08X'  
  endglobals

  struct QuestDefeatIllidan extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Azshara has beaten Illidan and took back control of the Naga's"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You will be able to train Immortal Guardian"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Reel them back", "Illidan has run off with a group of Naga, defeat him to bring them into the fold", "ReplaceableTextures\\CommandButtons\\BTNMetamorphosis.blp")
      call this.AddQuestItem(QuestItemLegendDead.create(LEGEND_VAULT))
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_NAZJATAR, true))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary