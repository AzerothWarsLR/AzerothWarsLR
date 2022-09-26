library QuestBrokenOne requires QuestData, DraeneiSetup

  globals
    private constant integer QUESTRESEARCH_ID = 'R083'   //This research is given when the quest is completed
  endglobals
  
  struct QuestBrokenOne extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "The hero Nobundo is now trainable at the Altar"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Nobundo will join the survivors on the Exodar"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Broken One", "The great shaman Nobundo is fighting to enable Velen and most of the Draenei to escape. If the Draenei hold out long enough, he might have time to join the survivors aboard the Exodar", "ReplaceableTextures\\CommandButtons\\BTNAkamanew.blp")
      call this.AddQuestItem(QuestItemTime.create(660))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n02O')))
      set this.ResearchId = QUESTRESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary