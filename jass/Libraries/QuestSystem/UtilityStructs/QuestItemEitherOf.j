library QuestItemEitherOf requires QuestItemData

  struct QuestItemEitherOf extends QuestItemData
    static method create takes QuestItemData questItemA, QuestItemData questItemB returns thistype
      local thistype this = thistype.allocate()
      set this.Description = questItemA.Description + " or " + questItemB.Description
      return this
    endmethod
  endstruct

endlibrary