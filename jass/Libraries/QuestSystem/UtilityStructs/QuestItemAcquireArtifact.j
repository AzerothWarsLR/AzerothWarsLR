library QuestItemAcquireArtifact requires QuestItemData

  struct QuestItemAcquireArtifact extends QuestItemData
    static method create takes Artifact target returns thistype
      local thistype this = thistype.allocate()
      return this
    endmethod
  endstruct

endlibrary