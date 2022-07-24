library QuestAwakenCthun requires QuestData, QuestItemChannelRect

  globals
    private constant integer QUEST_RESEARCH_ID = 'R06A'   //This research is given when the quest is completed
  endglobals

  struct QuestAwakenCthun extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "C'thun, Old God of madness and chaos, has awakened from his slumber. Azeroth itself shrinks back in fear as this unfathomably evil entity unleashes its singular gaze for the first time in millenia."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Gain control of C'thun and the ability to train Wasps" //Todo: from where?
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetUnitInvulnerable(gg_unit_U00R_0609, false)
      call PauseUnitBJ(false, gg_unit_U00R_0609) //Todo: no point using the BJ
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Awakening of C'thun", "The Old God C'thun slumbers beneath the ruins of Ahn'qiraj. Skeram will need to awaken him with an unholy ritual.", "ReplaceableTextures\\CommandButtons\\BTNCthunIcon.blp")
      call this.AddQuestItem(QuestItemChannelRect.create(gg_rct_CthunSummon, "C'thun", LEGEND_SKERAM, 420, 270))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary