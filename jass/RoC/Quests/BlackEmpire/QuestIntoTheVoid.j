library QuestIntoTheVoid requires QuestData, Artifact, BlackEmpireSetup, GeneralHelpers

  globals
    private constant integer QUESTRESEARCH_ID = 'R084'   //This research is given when the quest is completed
  endglobals

  struct QuestIntoTheVoid extends QuestData
    
    method operator Global takes nothing returns boolean
      return true
    endmethod
    
    private method operator CompletionPopup takes nothing returns string
      return "腐蚀者扎卡兹已经被从提尔之墓内唤醒，并加入了它的主人尤格萨隆"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "获得腐蚀者扎卡兹"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("提尔之墓", "很久以前，腐蚀者扎卡兹被守护者提尔所杀并与他一起被埋葬。只有萨拉塔斯，黑暗帝国之刃才有足够的力量去召唤他。", "ReplaceableTextures\\CommandButtons\\BTNGeneralVezax.blp")
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_XALATATH))
      call this.AddQuestItem(QuestItemArtifactInRect.create(ARTIFACT_XALATATH, gg_rct_TyrsFall, "提尔之陨"))
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_TyrsFall, "提尔之墓", LEGEND_VOLAZJ, 120, 170))
      set this.ResearchId = QUESTRESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary