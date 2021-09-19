library QuestScholomanceBuild requires QuestData

  globals
  endglobals

  struct QuestScholomanceBuild extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The City of Gold is now yours to command and has joined the " + this.Holder.Team.Name + "."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of all units in Kul'Tiras and enables Katherine Proodmoure to be trained at the altar"
    endmethod

    private method OnComplete takes nothing returns nothing
    endmethod

    private method OnAdd takes nothing returns nothing
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Secret Buildup", "The City of Gold just lies ahead.", "ReplaceableTextures\\CommandButtons\\BTNHumanShipyard.blp")
      call this.AddQuestItem(QuestItemBuild.create('u011', 2))
      return this
    endmethod
  endstruct

endlibrary