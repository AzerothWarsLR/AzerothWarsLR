library QuestBastionBuild requires QuestData

  globals
    private constant integer QUEST_RESEARCH_ID = 'R05F'   //This research is given when the quest is completed
  endglobals

  struct QuestBastionBuild extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Azil is now trainable"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Azil is trainable at the altar"
    endmethod

    private method OnComplete takes nothing returns nothing
    endmethod

    private method OnAdd takes nothing returns nothing
      call this.Holder.modObjectLimit(QUEST_RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("The Bastion of Twilight", "The Twilight Hammer is still small after their defeat during the Second War, their stronghold needs to be rebuilt if they are to serve the Old Gods well", "ReplaceableTextures\\CommandButtons\\BTNForsakenMausoleum.blp")
      call this.AddQuestItem(QuestItemBuild.create('o03D', 1))
      call this.AddQuestItem(QuestItemBuild.create('o03K', 20))
      call this.AddQuestItem(QuestItemBuild.create('o03I', 1))
      call this.AddQuestItem(QuestItemTrain.create('o04I', 3))
      set this.ResearchId = QUEST_RESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary