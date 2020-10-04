library QuestItemTime requires QuestItemData, Persons

  struct QuestItemTime extends QuestItemData
    static method create takes integer duration returns thistype
      local thistype this = thistype.allocate()
      return this
    endmethod
  endstruct

endlibrary