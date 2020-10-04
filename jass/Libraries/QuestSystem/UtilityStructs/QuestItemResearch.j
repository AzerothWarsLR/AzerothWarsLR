library QuestItemResearch requires QuestItemData

  struct QuestItemResearch extends QuestItemData
    static method create takes integer researchId returns thistype
      local thistype this = thistype.allocate()
      return this
    endmethod
  endstruct

endlibrary