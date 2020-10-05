library QuestItemArtifactInRect requires QuestItemData

  struct QuestItemArtifactInRect extends QuestItemData
    static method create takes Artifact artifact, rect targetRect, string rectName returns thistype
      local thistype this = thistype.allocate()
      set this.Description = GetItemName(artifact.item) + " is at " + rectName
      return this
    endmethod
  endstruct

endlibrary