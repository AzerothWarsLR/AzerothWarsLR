library QuestItemArtifactInRect requires QuestItemData

  struct QuestItemArtifactInRect extends QuestItemData
    static method create takes Artifact artifact, rect targetRect returns thistype
      local thistype this = thistype.allocate()
      return this
    endmethod
  endstruct

endlibrary