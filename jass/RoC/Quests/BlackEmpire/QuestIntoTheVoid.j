library QuestIntoTheVoid requires QuestData, Artifact, BlackEmpireSetup, GeneralHelpers

  globals
    private constant integer QUESTRESEARCH_ID = 'R084'   //This research is given when the quest is completed
  endglobals

  struct QuestIntoTheVoid extends QuestData
    
    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "Zakajz the Corruptor has been awakened from the Tomb of Tyr and has rejoined his master Yogg'Saron"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain the hero Zakajz the Corruptor"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Tomb of Tyr", "Long ago, Zakajz the Corruptor was killed by the Keeper Tyr and entombed with him. Only Xal'atath, the Black Blade, is powerful enough to summon him.", "ReplaceableTextures\\CommandButtons\\BTNGeneralVezax.blp")
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_XALATATH))
      call this.AddQuestItem(QuestItemArtifactInRect.create(ARTIFACT_XALATATH, gg_rct_TyrsFall, "Tyr's Fall"))
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_TyrsFall, "The Tomb of Tyr", LEGEND_VOLAZJ, 120, 170))
      set this.ResearchId = QUESTRESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary