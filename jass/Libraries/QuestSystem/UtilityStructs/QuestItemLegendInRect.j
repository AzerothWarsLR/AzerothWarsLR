library QuestItemLegendInRect requires QuestItemData, Persons

  struct QuestItemLegendInRect extends QuestItemData
    static method create takes Legend legend, rect target returns thistype
      local thistype this = thistype.allocate()
      return this
    endmethod
  endstruct

endlibrary