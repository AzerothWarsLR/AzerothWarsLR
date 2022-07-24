library QuestFeludius requires QuestData, TwilightSetup,  QuestItemControlPoint, QuestItemArtifactInRect, Artifact, ArtifactSetup

  globals
    private constant integer RESEARCH_ID = 'R07T'
  endglobals

  struct QuestFeludius extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "伟大的奥拉基尔加入了我们！"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "你可以在祭坛内召唤奥拉基尔。"
    endmethod


    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("风元素领主的礼物", "把传奇之剑雷霆之怒带到奥丹姆将让我们获得伟大风元素领主奥拉基尔的恩惠。", "ReplaceableTextures\\CommandButtons\\BTNfuryoftheair.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BD')))
      call this.AddQuestItem(QuestItemArtifactInRect.create(ARTIFACT_THUNDERFURY, gg_rct_UldumAmbiance, "奥丹姆"))
      set this.ResearchId = RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary