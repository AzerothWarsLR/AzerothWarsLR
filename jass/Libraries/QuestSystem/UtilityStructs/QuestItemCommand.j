library QuestItemCommand requires QuestItemData

  struct QuestItemCommand extends QuestItemData
    static method create takes string command returns thistype
      local thistype this = thistype.allocate()
      return this
    endmethod
  endstruct

endlibrary