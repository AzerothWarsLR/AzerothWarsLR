library QuestItemLegendLevel requires QuestItemData

  struct QuestItemLegendLevel extends QuestItemData
    static method create takes Legend legend, integer level returns thistype
      local thistype this = thistype.allocate()
      return this
    endmethod
  endstruct

endlibrary