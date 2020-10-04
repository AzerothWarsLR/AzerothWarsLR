library QuestItemEitherOf requires QuestItemData

  struct QuestItemEitherOf extends QuestItemData
    static method create takes QuestItemData questItemA, QuestItemData questItemB returns thistype
      local thistype this = thistype.allocate()
      return this
    endmethod
  endstruct

endlibrary