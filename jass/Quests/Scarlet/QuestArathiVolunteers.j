library QuestArathiVolunteers requires QuestData, ScarletSetup, QuestItemKillUnit

  globals
    private constant integer QUEST_RESEARCH_ID = 'R089'
  endglobals

  struct QuestArathiVolunteers extends QuestData
    private method operator CompletionPopup takes nothing returns string
      //Todo: what fight, flavour wise? Is it the Third War?
      return "The Arathi have been convinced to join the fight."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Enable to train Mounted Archers"
    endmethod

    public static method create takes nothing returns thistype
      //Todo: what fight, flavour wise? Is it the Third War?
      local thistype this = thistype.allocate("Arathi Volunteers", "The men of Stromgrade should join us in the fight.", "ReplaceableTextures\\CommandButtons\\BTNNobbyMansionCastle.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01K')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01Z')))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary