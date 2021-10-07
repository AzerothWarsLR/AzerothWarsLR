library QuestBeyondPortal requires QuestData, KultirasSetup

  globals 
    private constant integer QUEST_RESEARCH_ID = 'R06T'   //This research is given when the quest is completed
  endglobals

  struct QuestBeyondPortal extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The Citadel was destroyed, now the Order of Embers is re-emerging in Kul Tiras to face more sinister enemies"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "The Order of Embers is reborn and Lucille Waycrest is trainable"
    endmethod

    private method OnComplete takes nothing returns nothing

    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Beyond the Dark Portal", "The Citadel of the Horde must be destroyed, even if it means crossing into their world", "ReplaceableTextures\\CommandButtons\\BTNDarkPortal.blp")
      call this.AddQuestItem(QuestItemKillUnit.create(LEGEND_HELLFIRECITADEL.Unit))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary