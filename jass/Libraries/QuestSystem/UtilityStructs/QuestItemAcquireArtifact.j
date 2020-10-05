library QuestItemAcquireArtifact requires QuestItemData

  struct QuestItemAcquireArtifact extends QuestItemData
    static method create takes Artifact target returns thistype
      local thistype this = thistype.allocate()
      set this.Description = "Acquire " + GetItemName(target.item)
      return this
    endmethod
  endstruct

endlibrary